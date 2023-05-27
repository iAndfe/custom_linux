# Custom Install Notes

## Install Repos

```bash
sudo apt update && sudo apt upgrade
sudo apt install gparted neofetch cmatrix htop python3-venv python3-pip gnome-tweaks gnome-shell-extensions git screen mc ssh fonts-noto
```
## Install Themes

```bash
git clone https://github.com/vinceliuice/Fluent-icon-theme
cd Fluent-icon-theme
./install.sh
cd ..
rm -rf Fluent-icon-theme

git clone https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme
./install.sh
cd ..
rm -rf Fluent-gtk-theme
```
