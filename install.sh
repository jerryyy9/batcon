#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/jerryyy9/batcon/main/batcon"
BIN_PATH="/usr/local/bin/batcon"

echo "--- batcon Installer ---"

# handle the core script
if [ -f "./batcon" ]; then
    echo "Found local batcon script. Installing..."
    sudo cp ./batcon $BIN_PATH
else
    echo "Local script not found. Downloading from GitHub..."
    sudo curl -sSL $REPO_URL -o $BIN_PATH
fi

sudo chmod +x $BIN_PATH

# ddd sudoers rule for passwordless toggle
USER_NAME=$(whoami)
SUDOERS_FILE="/etc/sudoers.d/batcon"

echo "Configuring passwordless execution..."
echo "$USER_NAME ALL=(ALL) NOPASSWD: $BIN_PATH" | sudo tee $SUDOERS_FILE > /dev/null
sudo chmod 0440 $SUDOERS_FILE

# plasma integration
read -p "Would you like to install the KDE Plasma launcher? (y/n): " INSTALL_PLASMA
if [[ "$INSTALL_PLASMA" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    DESKTOP_FILE="$HOME/.local/share/applications/batcon.desktop"
    echo "Creating Plasma launcher..."
    cat <<EOF > $DESKTOP_FILE
[Desktop Entry]
Name=Toggle Battery Conservation
Comment=Switch between 60% and 100% charge limit
Exec=batcon
Icon=battery-charging-symbolic
Terminal=false
Type=Application
Categories=System;Settings;
EOF
    echo "Launcher created! You can now find 'batcon' in your App Launcher or pin it to your Taskbar."
fi

echo "--- Installation Complete! ---"
echo "Usage: Just type 'batcon' in any terminal."
