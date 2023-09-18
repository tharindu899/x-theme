#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
COLORS=("31" "32" "33" "34" "35" "36" "91" "92" "93" "94" "95" "96" "101" "102" "103" "104" "105" "106" "107")
ASCII_ART_URL="https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/txt/zsh.txt"  # URL to your ASCII art file
NAMES=()  # Initialize an empty array for step names

# Define the order of color groups
COLOR_GROUPS=("31 32 33" "34 35 36" "91 92 93" "94 95 96" "101 102 103" "104 105 106" "107")

# Function to shuffle colors randomly within each group
shuffle_colors() {
  local shuffled_colors=()
  for group in "${COLOR_GROUPS[@]}"; do
    local group_colors=($group)
    shuffled_colors+=($(shuf -e "${group_colors[@]}"))
  done
  echo "${shuffled_colors[@]}"
}

# Fetch the ASCII art file from the URL and add it to the NAMES array
ascii_art_text=$(curl -s "$ASCII_ART_URL")
while IFS= read -r line; do
  if [ -n "$line" ]; then
    # Replace % with spaces in each line
    line="${line//\%/ }"
    name=""
    for ((i = 0; i < 6; i++)); do
      read -r next_line
      next_line="${next_line//\%/ }"
      name="$name$next_line\n"
    done
    NAMES+=("$name")
  fi
done <<< "$ascii_art_text"

# Automatically calculate the number of steps
NUM_STEPS=${#NAMES[@]}

fl () {
    cd ~/x-theme
}

zsh-theme() {
    fl
    echo
    echo -e "\033[0;32m▀█▀ █ █ █▀▀ █▄█ █▀▀\033[0m"  
    echo -e "\033[0;33m █  █▀█ █▀▀ █ █ █▀▀\033[0m" 
    echo -e "\033[0;31m ▀  ▀ ▀ ▀▀▀ ▀ ▀ ▀▀▀\033[0m"
    echo
    bash start-zsh.sh
    echo
    echo -e "\033[0;32m▀█▀ █ █ █▀▀ █▄█ █▀▀   ▀█▀ █▀█ █▀▀ ▀█▀ █▀█ █   █\033[0m"  
    echo -e "\033[0;33m █  █▀█ █▀▀ █ █ █▀▀    █  █ █ ▀▀█  █  █▀█ █   █\033[0m" 
    echo -e "\033[0;31m ▀  ▀ ▀ ▀▀▀ ▀ ▀ ▀▀▀   ▀▀▀ ▀ ▀ ▀▀▀  ▀  ▀ ▀ ▀▀▀ ▀▀▀\033[0m"
    echo
    exit
}

pkg() {
    fl
    bash setup.sh
    echo
    echo -e "\033[0;32m █▀█ █ █ █▀▀ █▀▀   █ █ █▀█ █▀▄ █▀█ ▀█▀ █▀▀ █▀▄ \033[0m"
    echo -e "\033[0;33m █▀▀ █▀▄ █ █ ▀▀█   █ █ █▀▀ █ █ █▀█  █  █▀▀ █ █ \033[0m"
    echo -e "\033[0;31m ▀   ▀ ▀ ▀▀▀ ▀▀▀   ▀▀▀ ▀   ▀▀  ▀ ▀  ▀  ▀▀▀ ▀▀  \033[0m"
    echo
    exit
}

bannar() {
    fl
    echo
    echo -e "\033[0;32m █▀▄ █▀█ █▀█ █▀█ █▀▀ █▀▄\033[0m"
    echo -e "\033[0;33m █▀▄ █▀█ █ █ █ █ █▀▀ █▀▄\033[0m"
    echo -e "\033[0;31m ▀▀  ▀ ▀ ▀ ▀ ▀ ▀ ▀▀▀ ▀ ▀\033[0m"
    echo
    bash bannar.sh
    echo
    echo -e "\033[0;32m █▀▄ █▀█ █▀█ █▀█ █▀▀ █▀▄   ▀█▀ █▀█ █▀▀ ▀█▀ █▀█ █   █\033[0m"
    echo -e "\033[0;33m █▀▄ █▀█ █ █ █ █ █▀▀ █▀▄    █  █ █ ▀▀█  █  █▀█ █   █\033[0m"
    echo -e "\033[0;31m ▀▀  ▀ ▀ ▀ ▀ ▀ ▀ ▀▀▀ ▀ ▀   ▀▀▀ ▀ ▀ ▀▀▀  ▀  ▀ ▀ ▀▀▀ ▀▀▀\033[0m"
    echo
    exit
}

color() {
    fl
    bash color.sh
    exit
}

menu() {
    shuffled_colors=($(shuffle_colors))
    color_index=0
  
    for ((i = 0; i < NUM_STEPS; i++)); do
        color_code="\033[${shuffled_colors[$color_index]}m"
        name=${NAMES[$i]}
        clear
        printf "\n\n   $color_code$name \033[0m\n\n"
        printf "\033[1;92m[\033[0m1\033[1;92m]\033[1;93m Zsh Theme install\n"
        printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Create banner\n"
        printf "\033[1;92m[\033[0m3\033[1;92m]\033[1;93m Add colours\n"
        printf "\033[1;92m[\033[0m4\033[1;92m]\033[1;93m Pkg update\n"
        printf "\033[1;92m[\033[0m5\033[1;92m]\033[1;93m Exit\n\n\n"
        printf "\033[0;32m  Termux bannar save to use this command (ctrl+v y)\033[0m \n\033[0;31m  do you want defult bannar then exit (don't use {no-03} button) \033[0m\n\n"
        printf "\033[1;96m%s Entar number >> "
        read a
        clear
        case $a in
            1) zsh-theme ;;
            2) bannar ;;
            3) color ;;
            4) pkg ;;
            5) exit ;;
            *) menu ;;
        esac
        sleep 1
        clear
        ((color_index = (color_index + 1) % ${#shuffled_colors[@]}))
  done
  
}

cd $PREFIX/bin
if [ -e zsh2 ]; then
    menu
else
    pkg
    menu
fi
