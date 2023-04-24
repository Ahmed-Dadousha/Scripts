#!/bin/bash

# Config SXHKD
printf "\n==================================================================== Config SXHKD ==============================================================================================\n"
mkdir ~/.config/sxhkd && touch ~/.config/sxhkd/sxhkdrc
mkdir -p ~/.config/systemd/user/


# 
CONFIG="[Unit]
Description=Simple X Hotkey Daemon
After=xsession.target

[Service]
ExecStart=/usr/bin/sxhkd -c ~/.config/sxhkd/sxhkdrc
Restart=always
User=ahmed

[Install]
WantedBy=default.target"

# Reload the SystemD daemon to read the new unit file by running the following command:
systemctl --user daemon-reload
# Enable the sxhkd service to start on login by running the following command:
systemctl --user enable sxhkd.service

# Add keyboard shortcuts
# Terminal, Browser, Sound, Mount, File manger, Screenshot, Exit, Screencast

shortcuts=$(cat << EOF
ctrl + alt + t
    "gnome-terminal"


EOF

)

# Make sxhkd run on system startup

printf "\n================================================================================= Done =========================================================================================\n"
