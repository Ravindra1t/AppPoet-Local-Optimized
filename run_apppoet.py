import os
import sys
import subprocess

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def main():
    clear_screen()
    print("=" * 70)
    print("           APPPOET MALWARE ANALYSIS PIPELINE LAUNCHER")
    print("=" * 70)
    print("[INFO] Enforcing Local-Only Inference Mode (Air-Gapped Ollama)")
    print("=" * 70)
    
    # 1. Ask for APK Path with validation and retry loop
    while True:
        apk_path = input("\nPlease enter the full path to the APK file (or drag & drop it here):\n> ").strip()
        apk_path = apk_path.strip('"').strip("'")
        
        if not apk_path:
            print("[WARNING] Path cannot be empty. Please try again.")
            continue
            
        if os.path.exists(apk_path):
            break
        else:
            print(f"[ERROR] File not found at: {apk_path}")
            print("Please verify the path and try again.")

    print(f"\n[OK] Target APK Verified: {os.path.basename(apk_path)}")
    
    # 2. Locate underlying orchestrator script
    base_dir = os.path.dirname(os.path.abspath(__file__))
    if os.path.basename(base_dir) == "AppPoet_Project":
        script_path = os.path.join(base_dir, "src", "orchestrator", "apk_inference.py")
    else:
        script_path = os.path.join(base_dir, "AppPoet_Project", "src", "orchestrator", "apk_inference.py")
        
    if not os.path.exists(script_path):
        print(f"[FATAL] Orchestrator script not found at {script_path}")
        input("Press Enter to exit...")
        sys.exit(1)
        
    print(f"\n[INFO] Initializing pipeline in LOCAL OLLAMA mode...")
    
    # 3. Build execution command
    cmd = [
        sys.executable, script_path,
        "--apk", apk_path,
        "--no-cleanup"
    ]
        
    print(f"[INFO] Executing pipeline execution command...\n")
    print("=" * 70)
    
    try:
        subprocess.run(cmd, check=True)
        print("\n" + "=" * 70)
        print("[SUCCESS] AppPoet Malware Analysis completed successfully!")
        print("[INFO] You can view the full diagnostic report at 'report.txt' in the project root.")
    except subprocess.CalledProcessError as e:
        print("\n" + "=" * 70)
        print(f"[ERROR] Pipeline analysis execution failed with exit code {e.returncode}")
    except KeyboardInterrupt:
        print("\n" + "=" * 70)
        print("[INFO] Execution interrupted by user.")
        
    input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()
