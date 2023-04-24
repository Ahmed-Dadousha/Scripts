#!/bin/bash

# Config SXHKD
printf "\n==================================================================== Config SXHKD ==============================================================================================\n"
mkdir ~/.config/sxhkd && touch ~/.config/sxhkd/sxhkdrc

# Make sxhkd run on system startup
TEXT="[Desktop Entry]
Type=Application
Exec=/usr/bin/sxhkd
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Simple X Hot Key Demon
Name=Simple X Hot Key Demon
Comment[en_US]=Keybinding Process
Comment=Keybinding Process"

echo $TEXT > ~/.config/autostart/sxhkd.desktop

# Add keyboard shortcuts
# Terminal, Browser, Sound, Mount, File manger, Screenshot, Exit, Screencast

shortcuts=$(cat << EOF
ctrl + alt + t
    "gnome-terminal"


EOF

)

echo $shortcuts >> ~/.config/sxhkd/sxhkdrc

printf "\n================================================================================= Done =========================================================================================\n"


