#!/bin/bash

R () {
    cd $PREFIX/bin
    if [ -e python ]; then
        python ~/zsh-theme/.random.py
    else
        pkg install python
        python ~/zsh-theme/.random.py
    fi
}

fl () {
    cd ~/zsh-theme
}

ba() {
    R
    #figlet ZSH-THEME
    echo -e "▀▀█ █▀▀ █ █   ▀█▀ █ █ █▀▀ █▄█ █▀▀"
    echo -e "▄▀  ▀▀█ █▀█    █  █▀█ █▀▀ █ █ █▀▀"
    echo -e "▀▀▀ ▀▀▀ ▀ ▀    ▀  ▀ ▀ ▀▀▀ ▀ ▀ ▀▀▀"
    echo
}

zsh-theme() {
    fl
    bash start-zsh.sh
    echo -e "▀█▀ █ █ █▀▀ █▄█ █▀▀   ▀█▀ █▀█ █▀▀ ▀█▀ █▀█ █   █"  
    echo -e " █  █▀█ █▀▀ █ █ █▀▀    █  █ █ ▀▀█  █  █▀█ █   █" 
    echo -e " ▀  ▀ ▀ ▀▀▀ ▀ ▀ ▀▀▀   ▀▀▀ ▀ ▀ ▀▀▀  ▀  ▀ ▀ ▀▀▀ ▀▀▀"
    echo
}

button() {
    fl
    bash button.sh
    echo -e "█▀▄ █ █ ▀█▀ ▀█▀ █▀█ █▀█"
    echo -e "█▀▄ █ █  █   █  █ █ █ █"
    echo -e "▀▀  ▀▀▀  ▀   ▀  ▀▀▀ ▀ ▀"
}

zsh-setup() {
    fl
    bash setup.sh
}

bannar() {
    fl
    bash bannar.sh
}

menu() {
    clear
    ba
    printf "\033[1;92m[\033[0m1\033[1;92m]\033[1;93m Zsh Theme install\n"
    #printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Some changes in zsh theme\n"
    printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Termux Extra button\n"
    printf "\033[1;92m[\033[0m3\033[1;92m]\033[1;93m Create banner save com:(ctrl+x y)\n"
    printf "\033[1;92m[\033[0m4\033[1;92m]\033[1;93m Exit\n\n\n"
    printf "\033[0;32m  Termux bannar save to use this command (ctrl+v y)\033[0m \n\033[0;31m  do you want defult bannar then exit (don't use {no-03} button) \033[0m\n\n"
    printf "\033[1;96m%s Entar number >> "
    read a
    case $a in
        1) zsh-theme ;;
        #2) changes ;;
        2) button ;;
        3) bannar ;;
        4) exit ;;
        *) menu ;;
    esac
}

cd $PREFIX/bin
if [ -e zsh2 ]; then
    menu
else
    zsh-setup
    menu
fi
