"""
Lightweight Smali Regex Parser
==============================
Fast extraction of sensitive APIs and suspicious strings from Smali files.
No deep CFG analysis - eliminates Androguard path explosion on boilerplate.
"""
import os
import re

class AndroguardParser:
    """
    Lightweight parser using regex on Smali files instead of deep AST/CFG analysis.
    Processes only relevant security indicators, skips boilerplate Android libraries.
    """
    
    SENSITIVE_APIS = [
        'Landroid/telephony/TelephonyManager;->getDeviceId',
        'Landroid/telephony/SmsManager;->sendTextMessage',
        'Ljava/lang/Runtime;->exec',
        'Ldalvik/system/DexClassLoader;',
        'Ljavax/crypto/Cipher;->getInstance',
        'Ljava/net/HttpURLConnection;->connect',
        'Landroid/location/LocationManager;->getLastKnownLocation',
        'Landroid/media/AudioRecord;->startRecording',
        'Landroid/hardware/Camera;->open',
        'Ljava/lang/reflect/Method;->invoke',
        'Landroid/util/Base64;->encode',
        'Landroid/content/pm/PackageManager;->getInstalledPackages',
        'Landroid/telephony/SmsManager;->sendMultipartTextMessage',
        'Landroid/app/admin/DevicePolicyManager;',
        'Landroid/net/ConnectivityManager;->getNetworkInfo',
        'Landroid/accounts/AccountManager;->getAccounts',
        'Landroid/content/ClipboardManager;->setPrimaryClip',
        'Landroid/os/Process;->killProcess',
        'Ljava/lang/System;->loadLibrary',
        'Landroid/content/Intent;->getAction',
        'Landroid/net/Uri;->parse',
        'Ljava/io/File;->delete',
        'Landroid/database/sqlite/SQLiteDatabase;->execSQL',
        'Landroid/webkit/WebView;->addJavascriptInterface',
        'Landroid/accessibilityservice/AccessibilityService;',
        'Landroid/content/BroadcastReceiver;->abortBroadcast',
        'Landroid/os/PowerManager$WakeLock;->acquire',
        'Landroid/app/AlarmManager;->setRepeating',
        'Landroid/content/pm/ApplicationInfo;->sourceDir',
        'Ljava/security/cert/Certificate;',
        'Landroid/telephony/TelephonyManager;->getSubscriberId',
        'Landroid/telephony/TelephonyManager;->getSimSerialNumber',
        'Landroid/provider/Settings$Secure;->putString',
        'Landroid/content/Context;->registerReceiver',
        'Ljava/net/Socket;->connect',
        'Ljavax/net/ssl/SSLContext;->init',
        'Landroid/app/NotificationManager;->notify',
        'Landroid/telephony/SmsMessage;->createFromPdu',
        'Landroid/os/Build$VERSION;',
        'Landroid/content/pm/PackageInfo;->signatures',
        'Ljava/io/FileInputStream;->read',
        'Ljava/io/FileOutputStream;->write',
        'Landroid/util/Log;->d|Landroid/util/Log;->e|Landroid/util/Log;->i|Landroid/util/Log;->v|Landroid/util/Log;->w',
        'Landroid/os/Environment;->getExternalStorageDirectory',
        'Landroid/telephony/TelephonyManager;->getLine1Number',
        'Landroid/location/Location;->getLatitude',
        'Landroid/location/Location;->getLongitude',
        'Landroid/telephony/NeighboringCellInfo;',
        'Landroid/net/wifi/WifiInfo;->getMacAddress',
        'Landroid/net/wifi/WifiManager;->getConnectionInfo',
        'Landroid/bluetooth/BluetoothAdapter;->getAddress',
        'Landroid/content/ContentResolver;->query',
        'Landroid/content/ContentValues;->put',
        'Landroid/database/Cursor;->getString',
        'Landroid/os/Build;->SERIAL',
        'Landroid/provider/ContactsContract;',
        'Landroid/telephony/PhoneStateListener;',
        'Landroid/app/Activity;->startActivityForResult',
        'Landroid/os/Bundle;->getString',
        'Ljava/net/URL;->openConnection',
        'Lorg/apache/http/client/HttpClient;->execute',
        'Landroid/webkit/WebSettings;->setJavaScriptEnabled',
        'Landroid/webkit/WebView;->loadUrl',
        'Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading',
        'Landroid/app/PendingIntent;->getBroadcast',
        'Landroid/app/PendingIntent;->getService',
        'Landroid/app/PendingIntent;->getActivity',
        'Landroid/os/Handler;->postDelayed',
        'Landroid/os/IBinder;->transact',
        'Landroid/content/ServiceConnection;->onServiceConnected',
        'Ljava/lang/Thread;->start',
        'Ljava/util/concurrent/ExecutorService;->execute',
        'Ljava/util/Timer;->schedule',
        'Landroid/os/AsyncTask;->execute',
        'Ljava/lang/Runnable;->run',
        'Ldalvik/system/DexClassLoader;->loadClass',
        'Ldalvik/system/PathClassLoader;',
        'Ljava/net/ServerSocket;->accept',
        'Ljava/net/Socket;->getInputStream',
        'Ljava/net/Socket;->getOutputStream',
        'Ljavax/crypto/Cipher;->doFinal',
        'Ljavax/crypto/spec/SecretKeySpec;',
        'Ljava/security/MessageDigest;->digest',
        'Landroid/util/Base64;->decode',
        'Ljava/util/zip/ZipFile;->getInputStream',
        'Ljava/util/jar/JarFile;->getInputStream',
        'Landroid/content/res/AssetManager;->open',
        'Landroid/content/res/Resources;->openRawResource',
        'Landroid/telephony/TelephonyManager;->listen',
        'Landroid/telephony/PhoneStateListener;->onCallStateChanged',
        'Landroid/telephony/SmsManager;->divideMessage',
        'Landroid/app/Notification;->setLatestEventInfo',
        'Landroid/telephony/gsm/SmsManager;->sendTextMessage',
        'Landroid/provider/CallLog$Calls;->getLastOutgoingCall',
        'Landroid/media/MediaRecorder;->start',
        'Landroid/media/MediaRecorder;->setAudioSource',
        'Landroid/hardware/Camera$Parameters;->setPreviewSize',
        'Landroid/view/SurfaceHolder;->addCallback',
        'Landroid/view/WindowManager;->addView',
        'Landroid/view/Window;->setType',
        'Landroid/view/WindowManager$LayoutParams;->TYPE_SYSTEM_ALERT',
        'Landroid/view/WindowManager$LayoutParams;->TYPE_PHONE',
        'Landroid/inputmethodservice/InputMethodService;',
        'Landroid/app/KeyguardManager;->disableKeyguard',
        'Landroid/app/KeyguardManager$KeyguardLock;->reenableKeyguard',
        'Landroid/os/Vibrator;->vibrate',
        'Landroid/app/admin/DeviceAdminReceiver;',
        'Landroid/app/admin/DevicePolicyManager;->lockNow',
        'Landroid/app/admin/DevicePolicyManager;->wipeData',
        'Landroid/app/Service;->startForeground',
        'Landroid/app/Service;->stopForeground',
        'Landroid/content/Intent;->setComponent',
        'Landroid/content/Intent;->setClassName',
        'Landroid/content/Intent;->setAction',
        'Landroid/content/Intent;->addCategory',
        'Landroid/content/Intent;->setData',
        'Landroid/content/Intent;->setType',
        'Landroid/content/Intent;->putExtra',
        'Landroid/os/Parcel;->writeInterfaceToken',
        'Landroid/os/Parcel;->writeString',
        'Landroid/os/Parcel;->readException',
        'Landroid/os/IBinder;->queryLocalInterface',
        'Landroid/content/Context;->getSystemService',
        'Landroid/content/Context;->getApplicationInfo',
        'Landroid/content/Context;->getPackageName',
        'Landroid/content/Context;->getFilesDir',
        'Landroid/content/Context;->getCacheDir',
        'Landroid/content/Context;->getSharedPreferences',
        'Landroid/content/SharedPreferences;->edit',
        'Landroid/content/SharedPreferences$Editor;->putString',
        'Landroid/content/SharedPreferences$Editor;->commit',
        'Landroid/content/SharedPreferences$Editor;->apply',
        'Landroid/content/pm/PackageManager;->getApplicationInfo',
        'Landroid/content/pm/PackageManager;->getPackageInfo',
        'Landroid/content/pm/PackageManager;->queryIntentActivities',
        'Landroid/content/pm/PackageManager;->queryIntentServices',
        'Landroid/content/pm/PackageManager;->queryBroadcastReceivers',
        'Landroid/content/pm/PackageManager;->resolveActivity',
        'Landroid/content/pm/PackageManager;->resolveService',
        'Landroid/content/pm/ResolveInfo;',
        'Landroid/content/ComponentName;',
        'Landroid/content/IntentFilter;',
        'Landroid/os/Bundle;',
        'Landroid/os/Parcelable;',
        'Landroid/os/IBinder;',
        'Landroid/os/Parcel;',
        'Landroid/os/Parcelable$Creator;',
        'Landroid/app/Activity;->getIntent',
        'Landroid/app/Activity;->setResult',
        'Landroid/app/Activity;->finish',
        'Landroid/app/Activity;->onCreate',
        'Landroid/app/Activity;->onStart',
        'Landroid/app/Activity;->onResume',
        'Landroid/app/Activity;->onPause',
        'Landroid/app/Activity;->onStop',
        'Landroid/app/Activity;->onDestroy',
        'Landroid/app/Application;->onCreate',
        'Landroid/content/BroadcastReceiver;->onReceive',
        'Landroid/app/Service;->onBind',
        'Landroid/app/Service;->onCreate',
        'Landroid/app/Service;->onStartCommand',
        'Landroid/app/Service;->onDestroy',
        'Landroid/content/ContentProvider;->query',
        'Landroid/content/ContentProvider;->insert',
        'Landroid/content/ContentProvider;->delete',
        'Landroid/content/ContentProvider;->update'
    ]
    
    IP_PATTERN = re.compile(r'const-string\s+v\d+,\s*"(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"')
    URL_PATTERN = re.compile(r'const-string\s+v\d+,\s*"(http[s]?://[^"]+)"')
    DOMAIN_PATTERN = re.compile(r'const-string\s+v\d+,\s*"([a-zA-Z0-9][a-zA-Z0-9\-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,})"')
    EMAIL_PATTERN = re.compile(r'const-string\s+v\d+,\s*"([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})"')
    API_INVOKE_PATTERN = re.compile(r'invoke-\w+\s+.*\s+(L[\w/$]+;->[\w$]+)')
    
    MAX_APIS = 30
    MAX_STRINGS = 15
    
    def __init__(self):
        pass
    
    def parse_apk(self, apk_path):
        """
        Legacy interface - returns empty structure.
        Actual parsing happens via parse_smali_files() after apktool decoding.
        """
        return {
            'methods': [],
            'restricted_apis': [],
            'activities': [],
            'services': [],
            'receivers': [],
            'package_name': '',
            'version_code': '',
            'version_name': ''
        }
    
    def parse_smali_files(self, smali_dir):
        """
        Fast regex-based extraction from Smali files.
        
        Args:
            smali_dir: Directory containing decoded Smali files (e.g., _decoded/smali/)
        
        Returns:
            dict: Extracted sensitive APIs, IPs, URLs, domains (truncated to context limits)
        """
        sensitive_apis_found = set()
        ips_found = set()
        urls_found = set()
        domains_found = set()
        emails_found = set()
        all_api_invocations = set()
        
        if not os.path.exists(smali_dir):
            return {
                'restricted_apis': [],
                'ips': [],
                'urls': [],
                'domains': [],
                'emails': [],
                'all_apis': [],
                'smali_files_processed': 0
            }
        
        smali_files_processed = 0
        
        for root, dirs, files in os.walk(smali_dir):
            for file in files:
                if not file.endswith('.smali'):
                    continue
                
                # Skip Android framework classes (boilerplate)
                if any(x in root for x in [
                    'android/support', 'androidx/', 'kotlin/', 'kotlinx/',
                    'com/google/android/gms', 'com/android/vending',
                    'org/apache', 'org/json', 'javax/',
                    'junit/', 'org/hamcrest/'
                ]):
                    continue
                
                smali_files_processed += 1
                filepath = os.path.join(root, file)
                
                try:
                    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        
                        # Extract sensitive APIs
                        for api_sig in self.SENSITIVE_APIS:
                            if api_sig in content:
                                sensitive_apis_found.add(api_sig)
                        
                        # Extract all API invocations via regex
                        api_matches = self.API_INVOKE_PATTERN.findall(content)
                        all_api_invocations.update(api_matches)
                        
                        # Extract IPs
                        ip_matches = self.IP_PATTERN.findall(content)
                        ips_found.update(ip_matches)
                        
                        # Extract URLs
                        url_matches = self.URL_PATTERN.findall(content)
                        urls_found.update(url_matches)
                        
                        # Extract domains
                        domain_matches = self.DOMAIN_PATTERN.findall(content)
                        domains_found.update(domain_matches)
                        
                        # Extract emails
                        email_matches = self.EMAIL_PATTERN.findall(content)
                        emails_found.update(email_matches)
                        
                except Exception:
                    continue
        
        # Convert to list format and truncate for context window
        restricted_apis = [
            {'api_call': api, 'class_name': 'extracted', 'method': 'regex'}
            for api in list(sensitive_apis_found)[:self.MAX_APIS]
        ]
        
        return {
            'restricted_apis': restricted_apis,
            'ips': list(ips_found)[:self.MAX_STRINGS],
            'urls': list(urls_found)[:self.MAX_STRINGS],
            'domains': list(domains_found)[:self.MAX_STRINGS],
            'emails': list(emails_found)[:self.MAX_STRINGS],
            'all_apis': list(all_api_invocations)[:self.MAX_APIS],
            'smali_files_processed': smali_files_processed
        }
