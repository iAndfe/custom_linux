#!/bin/bash -eu

### Debian Post Install Script ###
echo "###################### Starting Script ######################"
echo "Updating your system..."
sudo apt update && sudo apt upgrade -y
echo "System update complete."

# Installing Packages
echo "###################### Installing Packages ######################"

echo "------ System Utilities and Tools ------"
sudo apt install -y gparted neofetch cmatrix htop screen mc ssh gdebi curl nano gnome-system-monitor file-roller evince build-essential
echo "System Utilities and Tools installed."

echo "------ Programming and Development Tools ------"
sudo apt install -y python3-venv python3-pip git
echo "Programming and Development Tools installed."

echo "------ GNOME Desktop and Extensions ------"
sudo apt install -y gnome-tweaks gnome-shell-extensions chrome-gnome-shell gnome-shell gnome-terminal nautilus gnome-control-center 
echo "GNOME Desktop and Extensions installed."

echo "------ Fonts ------"
sudo apt install -y fonts-noto fonts-dejavu
echo "Fonts installed."

echo "------ Office and Productivity ------"
sudo apt install -y libreoffice-calc libreoffice-gtk3 libreoffice-style-breeze
echo "Office and Productivity tools installed."

echo "------ Media Player ------"
sudo apt install -y vlc 
echo "VLC Media Player installed."

echo "------ Web Browsers ------"
sudo apt install -y firefox-esr
echo "Firefox Web Browser installed."

# System Hardening
echo "###################### System Hardening ######################"

echo "------ Installing and Configuring Fail2Ban ------"
sudo apt install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
echo "Fail2Ban installed and configured."

echo "------ Hardening SSH ------"
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh
echo "SSH hardened."

echo "------ Installing and Enabling UFW ------"
sudo apt install -y ufw
sudo ufw enable
sudo ufw allow ssh
echo "UFW installed, enabled, and configured."

# Installing Additional Software
echo "###################### Installing Additional Software ######################"

echo "------ Installing Visual Studio Code ------"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
echo "Visual Studio Code installed."

echo "------ Installing Google Chrome ------"
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome-keyring.gpg >/dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable
echo "Google Chrome installed."

echo "------ Installing Google Cloud CLI ------"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/cloud.google.gpg >/dev/null
sudo apt-get update && sudo apt-get install -y google-cloud-sdk
echo "Google Cloud CLI installed."

echo "------ Installing Firebase CLI ------"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g firebase-tools
echo "Firebase CLI installed."

echo "------ Installing Discord ------"
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt-get install -f
echo "Discord installed."

echo "------ Installing GitHub Desktop ------"
echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" | sudo tee /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list
curl -L https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
sudo apt-get update
sudo apt-get install github-desktop
echo "GitHub Desktop installed."

# Configuring GNOME
echo "###################### Configuring GNOME ######################"

echo "------ Configuring GNOME ------"
git clone https://github.com/vinceliuice/Fluent-icon-theme
cd Fluent-icon-theme
./install.sh
cd ..
rm -rf Fluent-icon-theme

gsettings set org.gnome.desktop.interface icon-theme 'Fluent-dark'
gsettings set org.gnome.desktop.interface font-name 'Noto Sans Display Regular 11'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans Display Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Mono Regular 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Noto Sans Bold 11'
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 6.0
echo "GNOME configuration complete."

echo "###################### Installation Complete ######################"
