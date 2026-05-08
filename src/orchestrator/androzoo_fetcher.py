import os
import time
import requests

def download_apks(api_key, hash_list, output_dir, limit=5):
    os.makedirs(output_dir, exist_ok=True)
    base_url = 'https://androzoo.uni.lu/api/download'
    
    successful_downloads = 0
    failed_downloads = 0
    
    for i, sha256_hash in enumerate(hash_list[:limit]):
        if i >= limit:
            break
            
        url = f'{base_url}?apikey={api_key}&sha256={sha256_hash}'
        
        try:
            response = requests.get(url, stream=True, timeout=60)
            
            if response.status_code == 403:
                print('Invalid API Key. Halting script.')
                return successful_downloads, failed_downloads
            
            if response.status_code == 404:
                print(f'Hash not found: {sha256_hash}')
                failed_downloads += 1
                time.sleep(7)
                continue
            
            if response.status_code == 429:
                print('Rate limit exceeded. Waiting 30 seconds...')
                time.sleep(30)
                response = requests.get(url, stream=True, timeout=60)
                if response.status_code != 200:
                    print(f'Retry failed for {sha256_hash}')
                    failed_downloads += 1
                    time.sleep(7)
                    continue
            
            if response.status_code == 200:
                apk_path = os.path.join(output_dir, f'{sha256_hash}.apk')
                with open(apk_path, 'wb') as f:
                    for chunk in response.iter_content(chunk_size=8192):
                        if chunk:
                            f.write(chunk)
                print(f'Successfully downloaded: {sha256_hash}')
                successful_downloads += 1
            else:
                print(f'HTTP {response.status_code} for {sha256_hash}')
                failed_downloads += 1
            
            time.sleep(7)
            
        except Exception as e:
            print(f'Error downloading {sha256_hash}: {e}')
            failed_downloads += 1
            time.sleep(7)
    
    return successful_downloads, failed_downloads

if __name__ == '__main__':
    API_KEY = os.environ.get("ANDROZOO_API_KEY", "")
    output_dir = '../../data/raw_apks'
    
    MALWARE_HASHES = [
        '000002b800160a0f8ebc7d6e46538d617ce53e5e495208bba4cc59ab09d436c8'
    ]
    
    print('Downloading test APK from AndroZoo...')
    success, failed = download_apks(API_KEY, MALWARE_HASHES, output_dir, limit=1)
    print(f'Download completed: {success} successful, {failed} failed')
