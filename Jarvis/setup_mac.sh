#!/bin/bash

# Step 1: Install Homebrew (if not installed)
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Step 2: Install Python 3 (if not installed)
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Installing Python 3..."
    brew install python
else
    echo "Python 3 is already installed."
fi

# Step 3: Install pip3 (if not installed)
if ! command -v pip3 &> /dev/null
then
    echo "pip3 is not installed. Installing pip3..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
else
    echo "pip3 is already installed."
fi

# Step 4: Install virtualenv (if not installed)
if ! command -v virtualenv &> /dev/null
then
    echo "virtualenv is not installed. Installing virtualenv..."
    pip3 install virtualenv
else
    echo "virtualenv is already installed."
fi

# Step 5: Clone your Jarvis code from the repo (if not done already)
echo "Cloning Jarvis project into current directory..."
git clone https://github.com/your-repo/voice_assistant.git

# Step 6: Navigate to the project folder
cd voice_assistant

# Step 7: Create and activate the virtual environment
python3 -m venv venv
source venv/bin/activate

# Step 8: Install dependencies
pip install -r requirements.txt

# Step 9: Run the Assistant
python main.py
