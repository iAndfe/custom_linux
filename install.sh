#!/bin/bash

# Install necessary packages
sudo apt update && sudo apt upgrade
sudo apt install gparted neofetch cmatrix htop python3-venv python3-pip gnome-tweaks gnome-shell-extensions git screen mc ssh fonts-noto gdebi curl libreoffice-calc libreoffice-gtk3 libreoffice-style-breeze fonts-dejavu


# Clone Fluent-icon-theme
git clone https://github.com/vinceliuice/Fluent-icon-theme
cd Fluent-icon-theme

# Prompt the user to check the code
echo "Please check the code in the Fluent-icon-theme directory for any potential issues. Press enter to continue when ready."
read

# If the user presses enter, the script continues
./install.sh
cd ..
rm -rf Fluent-icon-theme

# Clone Fluent-gtk-theme
git clone https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme

# Prompt the user to check the code
echo "Please check the code in the Fluent-gtk-theme directory for any potential issues. Press enter to continue when ready."
read

# If the user presses enter, the script continues
./install.sh
cd ..
rm -rf Fluent-gtk-theme


# Set the theme
gsettings set org.gnome.desktop.interface gtk-theme "Fluent-Dark-compact"

# Set the icon pack
gsettings set org.gnome.desktop.interface icon-theme 'Fluent-dark'

# Set the interface font
gsettings set org.gnome.desktop.interface font-name 'Noto Sans Display Regular 11'

# Set the document font
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans Display Regular 11'

# Set the monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Mono Regular 11'

# Set the legacy window title fonts
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Noto Sans Bold 11'


# Set Night Light to follow a manual schedule
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false

# Set Night Light to turn on at 20:00 (8 PM)
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20.0

# Set Night Light to turn off at 6:00 (6 AM)
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 6.0


echo "Install Complete!"