#!/bin/bash

echo "Installing batcon..."

sudo cp batcon /usr/local/bin/batcon
sudo chmod +x /usr/local/bin/batcon

USER_NAME=$(whoami)
SUDOERS_FILE="/etc/sudoers.d/batcon"

echo "Adding sudoers rule for passwordless toggle..."
echo "$USER_NAME ALL=(ALL) NOPASSWD: /usr/local/bin/batcon" | sudo tee $SUDOERS_FILE > /dev/null
sudo chmod 0440 $SUDOERS_FILE

echo "Done! You can now toggle battery mode by typing: batcon"
