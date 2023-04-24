#!/bin/bash
printf "\n\e[31m%s\e[0m\n" "============================================================================================== Index Script ================================================================================"

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Install Script =============================================================================="
# Run Install Script
./install_1.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Boot Script ================================================================================"
# Run boot Script
./boot_2.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Fonts Script ==============================================================================="
# Run Fonts Script
./fonts_3.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Mac Script ================================================================================="
# Run Mac Script
./mac_4.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== ZSH Script ================================================================================="
# Run ZSH Script
./zsh_5.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Alias Script ==============================================================================="
# Run Alias Script
./alias_6.sh

printf "\n\e[31m%s\e[0m\n" "============================================================================================== Done ======================================================================================="
