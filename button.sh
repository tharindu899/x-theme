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

ex() {
  cd $PREFIX/bin
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> e
  echo "killall -9 com.termux" >> e
  chmod 777 e
}

menu3 () {
  cd ~
  if [ -e .termux ]; then
    R
    cd ~/.termux
    rm -rf termux.properties
    #rm -f termux.properties > /dev/null 2>&1
    printf "\n\n    💠 ${YELLOW}Downloading button file${RESET}\n\n"
    echo -e "█▀▄ █ █ ▀█▀ ▀█▀ █▀█ █▀█"
    echo -e "█▀▄ █ █  █   █  █ █ █ █"
    echo -e "▀▀  ▀▀▀  ▀   ▀  ▀▀▀ ▀ ▀"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
    ex
    R
    printf "\n    💠 ${GREEN}Downloading complete${RESET}"
    printf "\n\n    💠 ${GREEN}Restart Termux and check${RESET}"
    printf "\n    💠 ${YELLOW}Create bannar & button${NC}:- ${GREEN}zsh2${NC}\n\n"
  else
    R
    mkdir ~/.termux
    cd ~/.termux
    #rm -f ~/.termux/termux.properties > /dev/null 2>&1
    printf "\n\n    💠 ${YELLOW}Downloading button file${RESET}\n\n"
    wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
    ex
    R
    printf "\n\n   💠 ${GREEN}Restart Termux and check${RESET}"
    printf "\n   💠 ${YELLOW}Create bannar & button${NC}:- ${GREEN}zsh2${NC}\n\n"
  fi
}

menu3
