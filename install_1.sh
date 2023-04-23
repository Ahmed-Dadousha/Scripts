#!/bin/bash

# Install snap store
printf "\n\e[34m%s\e[0m\n"  "============================================================================================== Install Snap Store ==========================================================================="
sudo apt install snapd -y && sudo snap install snap-store

# Update the system
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Update The System ============================================================================"
sudo apt update && sudo apt upgrade -y && flatpak update && sudo snap refresh && sudo apt autoremove -y && sudo apt autoclean -y && flatpak remove --unused -y

# Install Media codecs
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Install Media Codeces ========================================================================"
sudo apt-get install ubuntu-restricted-extras -y

# Install programming languages
printf "\n\e[34m%s\e[0m\n"  "============================================================================================== Install Programming Languages ================================================================"
sudo apt-get install default-jdk python3 build-essential gcc g++ -y

# Install Apps
printf "\n\e[34m%s\e[0m\n"  "============================================================================================== Install Apps ================================================================================="
sudo apt-get install timeshift htop tlp tlp-rdw gnome-tweaks neofetch gimp audacity kdenlive code vlc virtualbox vim tmux ncdu ffmpeg imagemagick cpufetch gdu bpytop speedtest-cli lolcat imwheel flatpak gnome-software-plugin-flatpak gnome-shell-extension-manager gir1.2-gmenu-3.0 gnome-screenshot plank doas preload gparted ncal youtube-dl -y

# Install Browser
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Download Google Chrome ======================================================================="
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y

printf "\n\e[34m%s\e[0m\n" "============================================================================================== Remove Unused Files =========================================================================="
# Remove unused files
sudo apt autoremove -y

printf "\n\e[33m%s\e[0m\n" "============================================================================================== Done ========================================================================================="
