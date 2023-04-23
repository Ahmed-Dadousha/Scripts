#!/bin/bash

printf "\n\e[34m%s\e[0m\n" "================================================================================= Update The System ========================================================================================="
# Update the system
doas nala update && doas nala upgrade -y

printf "\n\e[34m%s\e[0m\n" "================================================================================= Install Some Utilities ===================================================================================="
# Install some utilities
doas nala install zsh ranger git wget -y
mkdir -p ~/.config/zsh/plugins && mkdir -p ~/.cache/zsh
echo -e '\n\n# zsh\nexport ZDOTDIR="$HOME/.config/zsh"' >> ~/.profile

printf "\n\e[34m%s\e[0m\n" "=========================================================================== Download and Install Font ======================================================================================="
# Download font
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ./MesloLGS-NF
# Install Fonts
doas mv MesloLGS-NF /usr/share/fonts

printf "\n\e[34m%s\e[0m\n" "=========================================================================== Now Configure ZSH ================================================================================================"
printf "\n\e[35m%s\e[0m\n" "####################################################################### Now change terminal font to [MesloLGS-NF] ###########################################################################"
printf "\n\e[35m%s\e[0m\n" "############################################# Change HISTSIZE and SAVEHIST to 5000, HISTFILE to ~/.cache/zsh/.histfile ######################################################################"
sleep 5
# Conigure ZSH
zsh

printf "\n\e[34m%s\e[0m\n" "============================================================================= Download and Install Plugins =================================================================================="
# Download Plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/syntax-highlighting && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
# Install Plugins
echo -e '\n\n# Plugins\nsource ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme\nsource ~/.config/zsh/plugins/autosuggestions/zsh-autosuggestions.zsh\nsource ~/.config/zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.config/zsh/.zshrc

printf "\n\e[34m%s\e[0m\n" "=============================================================================== Install ranger =============================================================================================="
# Add ranger to zsh
echo -e '\n\n# ranger-cd\nfunction ranger-cd {\n    tempfile="$(mktemp -t tmp.XXXXXX)"\n    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"\n    test -f "$tempfile" &&\n    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then\n        cd -- "$(cat "$tempfile")"\n    fi  \n    rm -f -- "$tempfile"\n}\n\n#ranger-cd will run by alt+r\nbindkey -s "^\\er" "ranger-cd\\n"' >> ~/.config/zsh/.zshrc

printf "\n\e[34m%s\e[0m\n" "=============================================================================== Install lsd ================================================================================================="
# Add lsd
cd ~/Downloads
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb && doas dpkg -i lsd_0.23.1_amd64.deb

printf "\n\e[34m%s\e[0m\n" "=============================================================================== Change Default Shell ========================================================================================"
# ZSH as the default shell
doas -s
chsh -s /bin/zsh root

chsh -s /bin/zsh $USER

printf "\n\e[33m%s\e[0m\n" "=================================================================================== Done ===================================================================================================="
