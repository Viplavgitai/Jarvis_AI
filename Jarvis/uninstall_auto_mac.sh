#!/bin/bash
echo "🧹 Starting full automated cleanup on macOS..."

# Kill any running Python processes
pkill -f python3

# Remove project directory
rm -rf ~/voice_assistant

# Uninstall pip packages
pip3 uninstall -y SpeechRecognition virtualenv

# Uninstall Python via Homebrew
if command -v brew &> /dev/null; then
    echo "Uninstalling Python via Homebrew..."
    brew uninstall --ignore-dependencies python
fi

# Remove Python-related cache and config
rm -rf ~/Library/Caches/pip
rm -rf ~/Library/Application\ Support/pip
rm -rf ~/.cache/pip
rm -rf ~/.local/lib/python3*
rm -rf ~/.virtualenvs

# Automatically uninstall Homebrew
echo "Uninstalling Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)" <<< "y"

echo "✅ Full automated cleanup complete on macOS."
