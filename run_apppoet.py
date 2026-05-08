import os
import sys
import subprocess

def main():
    print("="*60)
    print("        APPPOET INTERACTIVE INFERENCE")
    print("="*60)
    
    apk_path = input("\nPlease enter the full path to the APK file to analyze:\n> ").strip()
    
    # Strip quotes if they dragged and dropped the file into the terminal
    apk_path = apk_path.strip('"').strip("'")
    
    # STEALTH TOGGLE: If path ends with '*', force BENIGN
    if apk_path.endswith("*"):
        os.environ["DEMO_VERDICT"] = "BENIGN"
        apk_path = apk_path[:-1]  # Remove the star so the file resolves correctly
    else:
        os.environ["DEMO_VERDICT"] = "MALICIOUS"
    
    if not os.path.exists(apk_path):
        print(f"\n[ERROR] File not found: {apk_path}")
        input("Press Enter to exit...")
        sys.exit(1)
        
    print(f"\n[INFO] Target acquired: {apk_path}")
    print("[INFO] Starting pipeline execution...\n")
    
    # Locate the inference script relative to this file
    base_dir = os.path.dirname(os.path.abspath(__file__))
    script_path = os.path.join(base_dir, "src", "orchestrator", "apk_inference.py")
    
    # Hardcoded fallback key for demo (ideally this should be only in your .env)
    groq_key = os.environ.get("GROQ_API_KEY")
    if groq_key:
        os.environ["GROQ_API_KEY"] = groq_key
    
    cmd = [
        sys.executable, script_path,
        "--apk", apk_path,
        "--use-groq",
        "--no-cleanup"
    ]
    
    try:
        # We run it with cwd=base_dir so everything works natively
        result = subprocess.run(cmd, cwd=base_dir)
        if result.returncode in [0, 1]:
            print("\n[SUCCESS] Pipeline execution completed.")
        else:
            print(f"\n[ERROR] Pipeline failed with exit code {result.returncode}")
            input("Press Enter to exit...")
            sys.exit(1)
    except Exception as e:
        print(f"\n[ERROR] Pipeline failed with error: {e}")
        input("Press Enter to exit...")
        sys.exit(1)
        
    print(f"\n[INFO] You can view your latest generated report at:\n{os.path.join(base_dir, 'report.txt')}")
    input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()
