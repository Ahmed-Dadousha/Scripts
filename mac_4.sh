#!/bin/bash

printf "\n\e[34m%s\e[0m\n" "========================================================================== Install gnome-tweaks and git ===================================================================================="
doas nala install git gnome-tweaks -y

printf "\n\e[34m%s\e[0m\n" "============================================================================ Create Working Directory ======================================================================================"
# Create Working Directory
cd ~/Downloads
mkdir mac-theme && cd mac-theme

printf "\n\e[34m%s\e[0m\n" "================================================================================ Download Main theme  ======================================================================================"
# Download Main Theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

printf "\n\e[34m%s\e[0m\n" "================================================================================= Install Main theme  ======================================================================================"
# Install Main Theme
doas ./WhiteSur-gtk-theme/install.sh -c Dark -c Light -i ubuntu -N mojave
doas ./WhiteSur-gtk-theme/tweaks.sh -f -d

printf "\n\e[34m%s\e[0m\n" "=============================================================================== Download Icons theme  ======================================================================================"
# Download Icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

printf "\n\e[34m%s\e[0m\n" "=============================================================================== Install Icons theme  ======================================================================================="

# Install Icons
./WhiteSur-icon-theme/install.sh

printf "\n\e[34m%s\e[0m\n" "============================================================================= Download Cursors theme  ======================================================================================"
# Download Cursors
git clone https://github.com/vinceliuice/McMojave-cursors

printf "\n\e[34m%s\e[0m\n" "============================================================================= Install Cursors theme ======================================================================================"
# Install cursors
cd McMojave-cursors && ./install.sh && cd ..

printf "\n\e[34m%s\e[0m\n" "============================================================================= Add Plank To Startup ======================================================================================"
# Add plank to startup
plank=$(cat << EOF
[Desktop Entry]\n\
Type=Application\n\
Exec=plank\n\
Hidden=false\n\
NoDisplay=false\n\
X-GNOME-Autostart-enabled=true\n\
Name=Plank Dock\n\
Comment=A dock for launching applications\n

EOF
)
doas touch ~/.config/autostart/plank.desktop
doas echo -e $plank > ~/.config/autostart/plank.desktop
plank &
printf "\n\e[33m%s\e[0m\n" "================================================================================ Done  ====================================================================================================="

