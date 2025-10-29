from pathlib import Path

from components import Config


SETTINGS_DIR = Path('./settings')

def main():
    file = "global.toml"
    settings = Config.load((SETTINGS_DIR / file).resolve())
    print(f"Settings loaded from {file}:")

    print(settings.get_vscode_json())
    
    
    
if __name__ == '__main__':
    main()
