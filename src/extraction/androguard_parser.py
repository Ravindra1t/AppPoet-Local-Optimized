"""
Lightweight Androguard Objects Parser
======================================
Fast extraction of sensitive APIs, permissions, and network indicators directly from 
Androguard Analysis (dx) and APK (a) objects. Completely avoids raw smali regex parsing.
"""
import re

class AndroguardParser:
    """
    Direct Androguard object parser that queries high-level AST and Analysis objects.
    """
    
    RESTRICTED_APIS = [
        'Landroid/telephony/TelephonyManager;->getDeviceId',
        'Landroid/telephony/SmsManager;->sendTextMessage',
        'Landroid/location/LocationManager;->getLastKnownLocation',
        'Landroid/media/AudioRecord;->startRecording',
        'Landroid/hardware/Camera;->open',
        'Landroid/content/pm/PackageManager;->getInstalledPackages',
        'Landroid/telephony/SmsManager;->sendMultipartTextMessage',
        'Landroid/net/ConnectivityManager;->getNetworkInfo',
        'Landroid/accounts/AccountManager;->getAccounts',
        'Landroid/webkit/WebView;->addJavascriptInterface',
        'Landroid/accessibilityservice/AccessibilityService;',
        'Landroid/os/PowerManager$WakeLock;->acquire',
        'Landroid/telephony/TelephonyManager;->getSubscriberId',
        'Landroid/telephony/TelephonyManager;->getSimSerialNumber',
        'Landroid/net/wifi/WifiInfo;->getMacAddress',
        'Landroid/net/wifi/WifiManager;->getConnectionInfo',
        'Landroid/bluetooth/BluetoothAdapter;->getAddress',
        'Landroid/provider/ContactsContract;',
        'Landroid/telephony/PhoneStateListener;',
        'Landroid/telephony/gsm/SmsManager;->sendTextMessage',
        'Landroid/provider/CallLog$Calls;->getLastOutgoingCall',
        'Landroid/media/MediaRecorder;->start',
        'Landroid/media/MediaRecorder;->setAudioSource',
        'Landroid/hardware/Camera$Parameters;->setPreviewSize',
        'Landroid/app/KeyguardManager;->disableKeyguard',
        'Landroid/app/KeyguardManager$KeyguardLock;->reenableKeyguard',
        'Landroid/os/Vibrator;->vibrate',
        'Landroid/app/admin/DevicePolicyManager;->lockNow',
        'Landroid/app/admin/DevicePolicyManager;->wipeData',
    ]

    SUSPICIOUS_APIS = [
        'Ljava/lang/Runtime;->exec',
        'Ldalvik/system/DexClassLoader;',
        'Ljavax/crypto/Cipher;->getInstance',
        'Ljava/net/HttpURLConnection;->connect',
        'Ljava/lang/reflect/Method;->invoke',
        'Landroid/util/Base64;->encode',
        'Landroid/app/admin/DevicePolicyManager;',
        'Landroid/content/ClipboardManager;->setPrimaryClip',
        'Landroid/os/Process;->killProcess',
        'Ljava/lang/System;->loadLibrary',
        'Ljava/io/File;->delete',
        'Landroid/database/sqlite/SQLiteDatabase;->execSQL',
        'Landroid/content/BroadcastReceiver;->abortBroadcast',
        'Landroid/app/AlarmManager;->setRepeating',
        'Ljava/security/cert/Certificate;',
        'Landroid/provider/Settings$Secure;->putString',
        'Ljava/net/Socket;->connect',
        'Ljavax/net/ssl/SSLContext;->init',
        'Landroid/telephony/SmsMessage;->createFromPdu',
        'Ljava/io/FileInputStream;->read',
        'Ljava/io/FileOutputStream;->write',
        'Landroid/os/Environment;->getExternalStorageDirectory',
        'Landroid/database/Cursor;->getString',
        'Ljava/net/URL;->openConnection',
        'Lorg/apache/http/client/HttpClient;->execute',
        'Landroid/os/Handler;->postDelayed',
        'Ljava/lang/Thread;->start',
        'Ljava/util/concurrent/ExecutorService;->execute',
        'Ljava/util/Timer;->schedule',
        'Landroid/os/AsyncTask;->execute',
        'Ldalvik/system/DexClassLoader;->loadClass',
        'Ldalvik/system/PathClassLoader;',
        'Ljava/net/ServerSocket;->accept',
        'Ljava/net/Socket;->getInputStream',
        'Ljava/net/Socket;->getOutputStream',
        'Ljavax/crypto/Cipher;->doFinal',
        'Ljavax/crypto/spec/SecretKeySpec;',
        'Ljava/security/MessageDigest;->digest',
        'Landroid/util/Base64;->decode',
    ]
    
    MAX_APIS = 30
    MAX_STRINGS = 15
    
    def __init__(self):
        pass
        
    def parse_apk_objects(self, a, dx):
        """
        Query Androguard Analysis (dx) and APK (a) objects directly for permissions, API invocations, 
        and Network indicators (URLs/Domains/IPs). No raw smali regex parsing.
        """
        restricted_apis_found = set()
        suspicious_apis_found = set()
        ips_found = set()
        urls_found = set()
        domains_found = set()
        emails_found = set()
        
        # 1. Permissions directly from a
        try:
            permissions = a.get_permissions()
        except Exception:
            permissions = []
        
        # 2. Activities, Services, Receivers directly from a
        try:
            activities = a.get_activities()
        except Exception:
            activities = []
            
        try:
            services = a.get_services()
        except Exception:
            services = []
            
        try:
            receivers = a.get_receivers()
        except Exception:
            receivers = []
        
        # 3. Find API calls using dx.find_methods()
        for api_sig in self.RESTRICTED_APIS:
            parts = api_sig.split(";->")
            if len(parts) == 2:
                cls_name = parts[0] + ";"
                method_name = parts[1]
                try:
                    for method_analysis in dx.find_methods(classname=cls_name, methodname=method_name):
                        if method_analysis.get_xref_from():
                            restricted_apis_found.add(api_sig)
                            break
                except Exception:
                    pass
                    
        for api_sig in self.SUSPICIOUS_APIS:
            parts = api_sig.split(";->")
            if len(parts) == 2:
                cls_name = parts[0] + ";"
                method_name = parts[1]
                try:
                    for method_analysis in dx.find_methods(classname=cls_name, methodname=method_name):
                        if method_analysis.get_xref_from():
                            suspicious_apis_found.add(api_sig)
                            break
                except Exception:
                    pass

        # 4. Extract strings & network indicators using dx.get_strings()
        ip_regex = re.compile(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$')
        url_regex = re.compile(r'^http[s]?://[^\s"]+$')
        domain_regex = re.compile(r'^[a-zA-Z0-9][a-zA-Z0-9\-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$')
        email_regex = re.compile(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        
        try:
            for string_analysis in dx.get_strings():
                val = string_analysis.get_value()
                if not val or not isinstance(val, str):
                    continue
                
                # Check for URLs
                if "http" in val:
                    url_match = url_regex.search(val)
                    if url_match:
                        urls_found.add(val)
                
                # Check for IPs
                if ip_regex.match(val):
                    ips_found.add(val)
                
                # Check for Domains
                if domain_regex.match(val):
                    domains_found.add(val)
                
                # Check for Emails
                if "@" in val:
                    email_match = email_regex.match(val)
                    if email_match:
                        emails_found.add(val)
        except Exception as e:
            print(f"[-] Error parsing strings from dx: {e}")

        # Convert to list format matching expectations
        restricted_apis = [
            {'api_call': api, 'class_name': 'extracted', 'method': 'restricted'}
            for api in list(restricted_apis_found)[:self.MAX_APIS]
        ]
        
        suspicious_apis = [
            {'api_call': api, 'class_name': 'extracted', 'method': 'suspicious'}
            for api in list(suspicious_apis_found)[:self.MAX_APIS]
        ]
        
        return {
            'permissions': list(permissions),
            'activities': list(activities),
            'services': list(services),
            'receivers': list(receivers),
            'restricted_apis': restricted_apis,
            'suspicious_apis': suspicious_apis,
            'ips': list(ips_found)[:self.MAX_STRINGS],
            'urls': list(urls_found)[:self.MAX_STRINGS],
            'domains': list(domains_found)[:self.MAX_STRINGS],
            'emails': list(emails_found)[:self.MAX_STRINGS]
        }
