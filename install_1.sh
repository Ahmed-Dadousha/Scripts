#!/bin/bash

#Install nala Package Manger
printf "\n\e[34m%s\e[0m\n"  "============================================================================================= Install Nala package manger ==================================================================" 
echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015F3DA22D980
sudo apt update -y && sudo apt install nala -y

printf "\n\e[34m%s\e[0m\n"  "=========================================================================================== Install doas ==================================================================================" 
# Setup Doas
sudo apt install doas -y
TEXT="permit nopass ahmed as root"
echo "$TEXT" | sudo tee -a /etc/doas.conf >/dev/null

# Install snap store
printf "\n\e[34m%s\e[0m\n"  "============================================================================================= Install Snap Store ==========================================================================="
doas nala install snapd -y && doas snap install snap-store

# Update the system
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Update The System ==========================================================================="
doas nala update && doas nala upgrade -y && flatpak update && doas snap refresh && doas nala autoremove -y && flatpak remove --unused -y

# Install Media codecs
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Install Media Codeces ======================================================================="
doas nala install ubuntu-restricted-extras -y

# Install programming languages
printf "\n\e[34m%s\e[0m\n"  "============================================================================================== Install Programming Languages ==============================================================="
doas nala install default-jdk python3 build-essential gcc g++ -y

# Install Apps
printf "\n\e[34m%s\e[0m\n"  "============================================================================================== Install Apps ================================================================================"
doas nala install timeshift hollywood htop tlp tlp-rdw gnome-tweaks neofetch gimp audacity kdenlive code vlc virtualbox vim tmux ncdu ffmpeg imagemagick cpufetch gdu bpytop speedtest-cli lolcat imwheel flatpak gnome-software-plugin-flatpak gnome-shell-extension-manager gir1.2-gmenu-3.0 gnome-screenshot plank preload gparted ncal youtube-dl sxhkd maim xclip xdotool mpv sxiv clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev -y


# Install Browser
printf "\n\e[34m%s\e[0m\n" "============================================================================================== Download Google Chrome ======================================================================"
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
doas dpkg -i google-chrome-stable_current_amd64.deb
doas nala install -f -y

printf "\n\e[34m%s\e[0m\n" "============================================================================================== Remove Unused Files ========================================================================="
# Remove unused files
doas nala autoremove -y

printf "\n\e[33m%s\e[0m\n" "============================================================================================== Done ========================================================================================"
