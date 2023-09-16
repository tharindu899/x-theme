#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
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
  printf "\n${GREEN}ZSH-THEME${NC}\n"
  echo
}

auto() {
  cd ~/../usr/etc
  if [ -e .plugin ]; then 
    #R
    printf "\n   💠 ${RED}Already exists autosuggestions/syntax-highlighting${NC}\n"
  else
    printf "\n   💠 ${YELLOW}cloning autosuggestions/syntax-highlighting${NC}\n\n"
    cd ~/../usr/etc
    mkdir .plugin
    cd .plugin
    git clone https://github.com/zsh-users/zsh-autosuggestions #> /dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting #> /dev/null 2>&1
    #R
    printf "\n   💠 ${GREEN}Cloning successful${NC}\n"
  fi
}

banner() {
  cd $PREFIX/etc
  rm -rf zshrc
  if [ ! -e banner.txt ]; then
    printf "\n   💠 ${YELLOW}Downloading banner.txt${NC}\n\n"
    cd $PREFIX/etc
    mv motd motd1
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/banner.txt
    printf "\n   💠 ${GREEN}Successfully added banner${NC}\n"
  else
    printf "\n   💠 ${RED}already exists banner${NC}\n"
  fi
  
  if [ ! -e zshrc ]; then
    printf "\n   💠 ${YELLOW}Downloading banner zshrc${NC}\n\n"
    cd $PREFIX/etc
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/zshrc
    printf "   💠 ${GREEN}Successfully added zshrc${NC}\n\n"
  else
    printf "\n   💠 ${RED}already exists zshrc${NC}\n"
  fi
}

theme() {
  #R
  printf "\n   💠 ${YELLOW}Downloading .zshrc .p10k${NC}\n\n"
  cd ~
  rm -rf .zshrc
  rm -rf .p10k.zsh
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.zshrc #> /dev/null 2>&1
  wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.p10k.zsh #> /dev/null 2>&1
  tr
}

tr() {
  cd ~/.termux
    # Check if font.ttf already exists
    if [ ! -e font.ttf ]; then
      printf "\n   💠 ${YELLOW}Downloading font${NC}\n\n"
      wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
      printf "\n   💠 ${GREEN}Successfully downloaded font.ttf${NC}\n"
    else
      printf "\n   💠 ${RED}already exists font.ttf${NC}\n"
    fi
    #R
    # Check if add.sh already exists
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
    #R
    printf "\n   💠 ${RED}Already installed oh-my-zsh${NC}\n"
  else
    #R
    printf "\n   💠 ${YELLOW}Cloning oh-my-zsh${NC}\n\n"
    cd ~
    git clone https://github.com/ohmyzsh/ohmyzsh
    mv ohmyzsh .oh-my-zsh
    printf "\n   💠 ${GREEN}Cloning successful oh-my-zsh ${NC}\n"
  fi
}

p10k () {
  cd ~
  if [ -e powerlevel10k ]; then
  #R 
  printf "\n   💠 ${RED}Already installed powerlevel10k${NC}\n"
else
  #R
  printf "\n   💠 ${YELLOW}Cloning powerlevel10k${NC}\n\n"
  cd ~
  git clone https://github.com/romkatv/powerlevel10k
  printf "\n   💠 ${GREEN}Cloning successful powerlevel10k ${NC}\n"
  fi
}

menu2() {
  sleep 1
  R
  auto
  theme
  banner
  ohmyzsh
  p10k
  chsh -s zsh
  printf "\n\n   💠 ${GREEN}Restart Termux${NC}"
  printf "   💠 ${YELLOW}Create bannar command${NC}:- ${GREEN}zsh2${NC}"
}

menu2
