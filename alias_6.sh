#!/bin/bash

# All aliases String Variables
aliases=$(cat << EOF
# My Custom Aliases\n\
alias cls=clear\n\
alias i="doas nala install -y"\n\
alias q="doas nala search "\n\
alias r="doas nala purge -y"\n\
alias u="doas nala update && sudo nala upgrade -y && flatpak update && sudo snap refresh && sudo nala autoremove -y && flatpak remove --unused -y"\n\
alias ls="lsd -la"\n\
\n
EOF
)
printf "\n\e[34m%s\e[0m\n" "============================================================================ Saving aliases to .zshrc ======================================================================================="

# Save aliases to .zshrc
echo -e $aliases >> ~/.config/zsh/.zshrc

printf "\n\e[33m%s\e[0m\n" "=================================================================================== Done ===================================================================================================="
