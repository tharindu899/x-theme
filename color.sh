#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
COLORS=("31" "32" "33" "34" "35" "36" "91" "92" "93" "94" "95" "96" "101" "102" "103" "104" "105" "106" "107")
ASCII_ART_URL="https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/txt/colors.txt"  # URL to your ASCII art file
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

# Function to create a "colour" directory if it doesn't exist
fl() {
  cd "$HOME/.termux" || exit
  if [ -e colour ]; then
    mv "colors.properties" "$HOME/.termux/colour/.colors.properties.bak.$(date +%Y.%m.%d-%H:%M:%S)"
    printf "\n   💠 ${RED}Already exists colour dir${NC}\n"
  else
    printf "\n   💠 ${YELLOW}Create colour dir${NC}\n\n"
    mkdir colour
    mv "colors.properties" "$HOME/.termux/colour/.colors.properties.bak.$(date +%Y.%m.%d-%H:%M:%S)"
  fi
}

# Function to install a Zsh theme
install_zsh_theme() {
  fl
  local color_code="$1"
  wget "https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/color/$color_code.colors"
  mv "$color_code.colors" colors.properties
  printf "\n   💠 ${GREEN}mv to .buk${NC}\n\n\n"
  termux-reload-settings
}

# Function to display the menu
menu() {
  local options=("aci" "aco" "azu" "bim" "cai" "chalk" "default" "dracula" "elementary" "elic" "eloi" "flat" "freya" "gruvbox.dark" "hemisu.dark" "hemisu.light" "hybrid" "int" "jup" "mar" "material" "material.ocean" "miu" "monikai.dark" "nep" "ocean.dark" "onr.dark" "one.light" "pali" "peppermint" "sat" "shel" "smyck" "saazzy" "solarized.dark" "solarized.light" "tango" "tin" "tomorrow" "tomorrow.night.blue" "tomorrow.night.bright" "tomorrow.night" "tomorrow.night.eighties" "ura" "vag" "back" "Exit")
  local color_codes=("aci" "aco" "azu" "bim" "cai" "chalk" "default" "dracula" "elementary" "elic" "eloi" "flat" "freya" "gruvbox.dark" "hemisu.dark" "hemisu.light" "hybrid" "int" "jup" "mar" "material" "material.ocean" "miu" "monikai.dark" "nep" "ocean.dark" "onr.dark" "one.light" "pali" "peppermint" "sat" "shel" "smyck" "saazzy" "solarized.dark" "solarized.light" "tango" "tin" "tomorrow" "tomorrow.night.blue" "tomorrow.night.bright" "tomorrow.night" "tomorrow.night.eighties" "ura" "vag")
  
  printf "\n\n   $color_code$name \033[0m\n"
  printf "      ${YELLOW}==========${NC}${GREEN} [Add a colors] ${NC}${YELLOW}=========${NC}\n"
  printf "        ${RED}================================${NC}\n\n"
  for ((i = 0; i < ${#options[@]}; i++)); do
    printf " \033[1;92m[\033[0m$((i+1))\033[1;92m]\033[1;93m ${options[i]}\n"
  done
  printf "\n"
  printf "\033[1;96m%s Enter number >> " 

  read choice

  case $choice in
    [1-44])
      if [ "$choice" -ge 1 ] && [ "$choice" -le ${#color_codes[@]} ]; then
        install_zsh_theme "${color_codes[choice-1]}"
      else
        printf "\nInvalid choice. Please enter a valid number.\n\n"
        menu
      fi
      ;;
    45)
      zsh2
      # Add functionality for "Pkg update" here
      # You can replace the comment with your update logic.
      printf "\n   💠 ${GREEN}Back to the X-heme${NC}\n\n\n"
      menu
      ;;
    8)
      exit
      ;;
    *)
      printf "\nInvalid choice. Please enter a valid number.\n\n"
      menu
      ;;
  esac
}

# Main script
menu
clear
bash color.sh