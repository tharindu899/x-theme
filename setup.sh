#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m' # No Color

setup () {
  printf "\n\n   💠 ${GREEN}Installing Requirements..${RESET}\n\n"
  printf "\n\n   💠 ${YELLOW}apt update${RESET}\n\n"
  apt update
  printf "\n\n   💠 ${YELLOW}apt upgrade${RESET}\n\n"
  apt upgrade -y
  clear
  printf "\n\n   💠 ${GREEN}python${RESET}\n\n"
  apt install python -y
  clear
  printf "\n\n   💠 ${BLUE}figlet${RESET}\n\n"
  apt install figlet -y
  clear
  printf "\n\n   💠 ${MAGENTA}git${RESET}\n\n"
  apt install git -y
  clear
  printf "\n\n   💠 ${CYAN}wget${RESET}\n\n"
  apt install wget -y
  clear
  printf "\n\n   💠 ${WHITE}zsh${RESET}\n\n"
  apt install zsh -y
  clear
  printf "\n\n   💠 ${GREEN}curl${RESET}\n\n"
  apt install curl -y
  clear
  printf "\n\n   💠 ${YELLOW}lsd${RESET}\n\n"
  apt install lsd -y
  clear
  printf "\n\n   💠 ${BLUE}micro${RESET}\n\n"
  apt install micro -y
  clear
  printf "\n\n   💠 ${YELLOW}zip/unzip${RESET}\n\n"
  pkg install zip -y
  clear
  printf "\n\n   💠 ${YELLOW}Logo-ls${RESET}\n\n"
  pkg install logo-ls -y
  clear
  printf "\n\n   💠 ${MAGENTA}AcodeX${RESET}\n\n"
  curl -sL https://raw.githubusercontent.com/bajrangCoder/acode-plugin-acodex/main/installServer.sh | bash
  printf "\n\n   💠 ${GREEN}All installed${RESET}\n\n"
  sleep 3
  clear
  cd $PREFIX/bin
  rm -rf zsh2
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> zsh2
  echo "bash ~/zsh-theme/zsh.sh" >> zsh2
  chmod 777 zsh2
  rm -rf add
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> add
  echo "bash ~/add.sh" >> add
  chmod 777 add
  printf "\n\n   💠 ${CYAN}Now you can use${RESET}:- zsh2\n"
  printf "   💠 ${YELLOW}Now you can use to create alias${RESET}:- add\n"
}

setup
