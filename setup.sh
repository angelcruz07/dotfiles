#!/usr/bin.bash

# Author: Angel Cruz (angelcruz07)

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Banner de Arch Linux
# function archBanner(){
#     echo -e "${turquoiseColour}    ___   ___    ____  __   _______      _______   _______   __   __   __   _______ ${endColour}"
#     echo -e "${turquoiseColour}   |   | |   |  |    ||  | |       |    |   _   | |       | |  | |  | |  | |       |${endColour}"
#     echo -e "${turquoiseColour}   |   | |   |  |    ||  | |    ___|    |  |_|  | |   _   | |  | |  | |  | |  _____|${endColour}"
#     echo -e "${turquoiseColour}   |   | |   |  |    ||  | |   |___     |       | |  | |  | |  | |  |_|  | | |_____ ${endColour}"
#     echo -e "${turquoiseColour}   |   | |   |  |   _||  | |    ___|    |       | |  |_|  | |  | |       | |_____  |${endColour}"
#     echo -e "${turquoiseColour}   |   | |   |  |  |  |  | |   |___     |   _   | |       | |  | |       |  _____| |${endColour}"
#     echo -e "${turquoiseColour}   |___| |___|  |__|  |__| |_______|    |__| |__| |_______| |__|  |_______| |_______|${endColour}\n"
# }

# Pregunta inicial
function readyQuestion(){
    echo -e "${yellowColour}Are you ready to configure your Arch Linux environment? (Y/n) ${endColour}"
    read -r response
    response=${response:-"Y"}
    if [[ $response =~ ^[Yy]$ ]]; then
        return 0
    else
        echo -e "\n${redColour}Exiting...${endColour}\n"
        exit 1
    fi
}

function installBasicPackages(){
    echo -e "\n${yellowColour}Installing basic packages...${endColour}\n"
    sudo pacman -S qtile rofi pulseaudio pavucontrol feh arandr

    if [ $? -eq 0]; then
        echo -e "\n${greenColour}Basic packages installed successfully!${endColour}\n"
    else
        echo -e "\n${redColour}Error installing basic packages${endColour}\n"
        exit 1
    fi
}


