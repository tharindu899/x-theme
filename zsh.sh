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
    figlet ZSH-THEME
    echo
}

zsh-theme() {
    ba
    fl
    bash zsh-theme.sh
}

button() {
    fl
    bash button.sh
}

zsh-setup() {
    fl
    bash setup.sh
}

bannar() {
    # Add your custom logic for option 4 here
    fl
    bash bannar.sh
}

menu() {
    clear
    ba
    printf "\033[1;92m[\033[0m1\033[1;92m]\033[1;93m Zsh Theme install\n"
    #printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Some changes in zsh theme\n"
    printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Termux Extra button\n"
    printf "\033[1;92m[\033[0m3\033[1;92m]\033[1;93m Create banner\n"
    printf "\033[1;92m[\033[0m4\033[1;92m]\033[1;93m Exit\n\n\n"
    printf "\033[1;96m%sZsh@theme >> "
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
