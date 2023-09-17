#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
COLORS=("31" "32" "33" "34" "35" "36" "91" "92" "93" "94" "95" "96" "101" "102" "103" "104" "105" "106" "107")
ASCII_ART_URL="https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/txt/theme.txt"  # URL to your ASCII art file
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

# fl () {
#   cd ~/zsh-theme
# }

highlighting () {
  cd $PREFIX/etc/.plugin
  if [ -e zsh-syntax-highlighting ]; then 
    printf "\n   💠 ${RED}Already exists syntax-highlighting${NC}\n"
  else
    printf "\n   💠 ${YELLOW}cloning syntax-highlighting${NC}\n\n"
    cd $PREFIX/etc
    mkdir .plugin
    cd .plugin
    git clone https://github.com/zsh-users/zsh-syntax-highlighting #> /dev/null 2>&1
    printf "\n   💠 ${GREEN}Cloning successful${NC}\n"
  fi
}

suggestions () {
  cd $PREFIX/etc/.plugin
  if [ -e zsh-autosuggestions ]; then
    printf "\n   💠 ${RED}Already exists autosuggestions${NC}\n"
  else
    printf "\n   💠 ${YELLOW}cloning autosuggestions${NC}\n\n"
    cd $PREFIX/etc/.plugin
    # mkdir .plugin
    cd .plugin
    git clone https://github.com/zsh-users/zsh-autosuggestions #> /dev/null 2>&1
    printf "\n   💠 ${GREEN}Cloning successful${NC}\n"
  fi
}

banner () {
  cd $PREFIX/etc
  if [ ! -e banner.txt ]; then
    printf "\n   💠 ${YELLOW}Downloading banner.txt${NC}\n\n"
    cd $PREFIX/etc
    mv motd motd1
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/banner.txt
    printf "\n   💠 ${GREEN}Successfully added banner${NC}\n"
  else
    printf "\n   💠 ${RED}already exists banner${NC}\n"
  fi
}

font() {
  cd ~/.termux
    if [ ! -e font.ttf ]; then
      printf "\n   💠 ${YELLOW}Downloading font${NC}\n\n"
      wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
      printf "\n   💠 ${GREEN}Successfully downloaded font.ttf${NC}\n"
    else
      printf "\n   💠 ${RED}already exists font.ttf${NC}\n"
    fi
}

add () {
  cd ~/.termux
    if [ ! -e add.sh ]; then
      printf "\n   💠 ${YELLOW}Downloading add.sh${NC}\n\n"
      wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
      printf "\n   💠 ${GREEN}Successfully downloaded add.sh${NC}\n"
    else
      printf "\n   💠 ${RED}already exists add.sh${NC}\n"
    fi
}

ohmyzsh () {
  cd ~
  if [ -e .oh-my-zsh ]; then
    printf "\n   💠 ${RED}Already installed oh-my-zsh${NC}\n"
  else
    printf "\n   💠 ${YELLOW}Cloning oh-my-zsh${NC}\n\n"
    cd ~
    git clone https://github.com/ohmyzsh/ohmyzsh
    mv ohmyzsh .oh-my-zsh
    printf "\n   💠 ${GREEN}Cloning successful oh-my-zsh ${NC}\n"
  fi
}

powerl () {
    cd ~
    if [ -e powerlevel10k ]; then
    printf "\n   💠 ${RED}Already installed powerlevel10k${NC}\n"
  else
    printf "\n   💠 ${YELLOW}Cloning powerlevel10k${NC}\n\n"
    cd ~
    git clone https://github.com/romkatv/powerlevel10k
    printf "\n   💠 ${GREEN}Cloning successful powerlevel10k ${NC}\n"
    fi
}

etc () { 
  cd $PREFIX/etc
  if [ ! -e zshrc ]; then
    printf "\n   💠 ${YELLOW}Downloading banner zshrc${NC}\n\n"
    cd $PREFIX/etc
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/zshrc
    printf "   💠 ${GREEN}Successfully added zshrc${NC}\n\n"
  else
    printf "\n   💠 ${RED}already exists zshrc${NC}\n"
  fi
}

zshrc () {
  cd ~
  printf "\n   💠 ${YELLOW}Downloading .zshrc${NC}\n\n"
  rm -rf .zshrc
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.zshrc #> /dev/null 2>&1
  tr
}

p10k.sh () {
  cd ~
  printf "\n   💠 ${YELLOW}Downloading .p10k.zsh${NC}\n\n"
  rm -rf .p10k.zsh
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.p10k.zsh #> /dev/null 2>&1
  tr
}

button () {
  cd ~/.termux
  if [ -e .termux ]; then
    cd ~/.termux
    mv termux.properties termux.properties1
    printf "\n\n    💠 ${YELLOW}Downloading button file${RESET}\n\n"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
    printf "\n    💠 ${GREEN}Downloading complete${RESET}"
  else
    mv termux.properties termux.properties1
    printf "\n\n    💠 ${YELLOW}Downloading button file${RESET}\n\n"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
  fi
}

last () {
  printf "  \033[0;33m Now you can use to create alias\033[0m:- \033[0;31m add\033[0m\n"
  printf "\n\n   💠 ${GREEN}Restart Termux${NC}\n"
  printf "   💠 ${YELLOW}Create bannar & button${NC}:- ${GREEN}zsh2${NC}\n\n"
}

# Function to set up the environment with randomized colors
setup () {
  shuffled_colors=($(shuffle_colors))
  color_index=0

  for ((i = 0; i < NUM_STEPS; i++)); do
    color_code="\033[${shuffled_colors[$color_index]}m"
    name=${NAMES[$i]}
    printf "\n\n   $color_code$name \033[0m\n\n"
       
    case $i in
      0)
        highlighting
        ;;
      1)
        suggestions
        ;;
      2)
        banner
        ;;
      3)
        font
        ;;
      4)
        add
        ;;
      5)
        ohmyzsh
        ;;
      6)
        powerl
        ;;
      7)
        etc
        ;;
      8)
        zshrc
        ;;
      9)
        p10k.sh
        ;;
      10)
        button
        ;;
      11)
        last
        ;;
    esac
    sleep 1
    clear
    
    # Increment the color index and wrap around if it reaches the end of the shuffled_colors array
    ((color_index = (color_index + 1) % ${#shuffled_colors[@]}))
  done
  
  chsh -s zsh
  zsh2

}

setup