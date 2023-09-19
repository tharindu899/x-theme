#!/bin/bash

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

create_banner() {
    cd $PREFIX/etc
    #nano banner.txt
    nano rxfetch
    printf "\n   💠 ${GREEN}Successfully created banner${NC}\n\n"
}

create_banner
