#!/bin/bash

# All aliases String Variables
aliases=$(cat << EOF
# My Custom Aliases\n\
alias cls=clear\n\
alias i="sudo apt install -y"\n\
alias q="sudo apt search "\n\
alias r="sudo apt purge -y"\n\
alias u="sudo apt update && sudo apt upgrade -y && flatpak update && sudo snap refresh && sudo apt autoremove -y && sudo apt autoclean -y && flatpak remove --unused -y"\n\
alias ls="lsd -la"\n\
\n
EOF
)
printf "\n\e[34m%s\e[0m\n" "============================================================================ Saving aliases to .zshrc ======================================================================================="

# Save aliases to .zshrc
echo -e $aliases >> ~/.config/zsh/.zshrc

printf "\n\e[33m%s\e[0m\n" "=================================================================================== Done ===================================================================================================="
