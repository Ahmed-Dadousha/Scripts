#!/bin/bash

# Config SXHKD
printf "\n==================================================================== Config SXHKD ==============================================================================================\n"
mkdir ~/.config/sxhkd ~/.config/autostart/sxhkd.desktop -p && touch ~/.config/sxhkd/sxhkdrc

# Make sxhkd run on system startup
TEXT="[Desktop Entry]\n
Type=Application\n
Exec=/usr/bin/sxhkd\n
Hidden=false\n
NoDisplay=false\n
X-GNOME-Autostart-enabled=true\n
Name[en_US]=Simple X Hot Key Demon\n
Name=Simple X Hot Key Demon\n
Comment[en_US]=Keybinding Process\n
Comment=Keybinding Process\n"

echo -e $TEXT > ~/.config/autostart/sxhkd.desktop

# Add keyboard shortcuts
# Terminal, Browser, Sound, Mount, File manger, Screenshot, Exit, Screencast

shortcuts=$(cat << EOF
ctrl + alt + t
    "gnome-terminal"


EOF

)

echo -e $shortcuts >> ~/.config/sxhkd/sxhkdrc

printf "\n================================================================================= Done =========================================================================================\n"


