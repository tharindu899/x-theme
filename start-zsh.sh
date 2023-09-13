#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
ORANGE='\033[0;91m'
PINK='\033[0;95m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

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
  printf "${GREEN}ZSH-THEME${NC}\n"
  echo
}

auto() {
  R
  fl
  cd ~/../usr/etc
  mkdir .plugin
  cd .plugin
  printf "\n\n${MAGENTA}Please wait for cloning...${NC}\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions > /dev/null 2>&1
  git clone https://github.com/zsh-users/zsh-syntax-highlighting > /dev/null 2>&1
  R
  printf "\n${CYAN}Cloning successful${NC}\n\n"
}

tr() {
  cd ~
  if [ -e .termux ]; then
    R
    cd ~/.termux
    printf "\n${MAGENTA}Downloading font🖊️ \n\n"
    wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
    printf "\n${ORANGE}Downloading create alias file add.sh \n\n"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
    R
    printf "\n${GREEN}Successfully downloaded${NC}\n"
  else
    R
    cd ~
    mkdir ~/.termux
    cd ~/.termux
    pwd
    printf "\n${MAGENTA}Downloading font🖊️ \n\n"
    wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
    printf "\n${ORANGE}Downloading create alias file add.sh \n\n"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
    R
    printf "\n${GREEN}Successfully downloaded${NC}\n"
  fi
}

setuping-theme() {
  R
  printf "\n\n${ORANGE}Setting up theme, please wait...${NC}\n\n"
  cd ~
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.zshrc > /dev/null 2>&1
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.p10k.zsh > /dev/null 2>&1
  tr
}

chp() {
  cd ~
  if [ -e powerlevel10k ]; then
    R
    printf "${GREEN}Successfully cloning powerlevel10k${NC}\n\n"
  else
    printf "\n\n${RED}Sorry, powerlevel10k is not installed!${NC}\n\n"
    exit
  fi
}

cho() {
  cd ~
  if [ -e .oh-my-zsh ]; then
    R
    printf "\n\n${GREEN}Cloning successful${NC}\n\n"
  else
    printf "\n\n${RED}Cloning failed, please try again!${NC}\n\n"
    exit
  fi
}

ohmyzsh () {
  cd ~
  if [ -e .oh-my-zsh ]; then
    R
    printf "\n\n${GREEN}Already installed oh-my-zsh${NC}\n\n"
  else
    R
    printf "\n\n${PINK}Cloning oh-my-zsh${NC}\n"
    cd ~
    git clone https://github.com/ohmyzsh/ohmyzsh
    mv ohmyzsh .oh-my-zsh
  fi
}

menu2() {
  R
  printf "\n\n${PINK}Installing...${NC}\n\n"
  R
  printf "${PINK}Cloning powerlevel10k approx. 80MB${NC}\n"
  sleep 1
  cd ~
  git clone https://github.com/romkatv/powerlevel10k
  chp
  ohmyzsh
  cho
  auto
  setuping-theme
  chsh -s zsh
  R
  printf "\n${GREEN}Restart Termux${NC}\n"
}

menu2
