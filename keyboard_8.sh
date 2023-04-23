#!/bin/bash

# Create .config/sxhkd/sxhkdrc
printf "\n======================================================================= Create sxhkd config file ================================================================================\n"
mkdir ~/.config/sxhkd && touch ~/.config/sxhkd/sxhkdrc

# Add keyboard shortcuts
# Terminal, Browser, Sound, Mount, File manger, Screenshot, Exit, Screencast

shortcuts=$(cat << EOF
ctrl + alt + t
    "gnome-terminal"


EOF

)

# Make sxhkd run on system startup

printf "\n================================================================================= Done ==========================================================================================\n"
