import subprocess
import xml.etree.ElementTree as ET
import os

APKTOOL_PATH = r'C:\tools\apktool.bat'

class APKToolDecoder:
    def __init__(self, output_dir):
        self.output_dir = output_dir
    
    def decode_apk(self, apk_path):
        subprocess.run([APKTOOL_PATH, 'd', apk_path, '-o', self.output_dir, '-f'], check=True, shell=True)
        manifest_path = os.path.join(self.output_dir, 'AndroidManifest.xml')
        tree = ET.parse(manifest_path)
        root = tree.getroot()
        permissions = [elem.attrib.get('{http://schemas.android.com/apk/res/android}name') for elem in root.iter() if 'permission' in elem.tag]
        activities = [elem.attrib.get('{http://schemas.android.com/apk/res/android}name') for elem in root.iter() if elem.tag == 'activity']
        services = [elem.attrib.get('{http://schemas.android.com/apk/res/android}name') for elem in root.iter() if elem.tag == 'service']
        receivers = [elem.attrib.get('{http://schemas.android.com/apk/res/android}name') for elem in root.iter() if elem.tag == 'receiver']
        return {
            'permissions': permissions,
            'activities': activities,
            'services': services,
            'receivers': receivers
        }
