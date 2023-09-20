#!/bin/bash

# Define ANSI color codes and relevant names
COLORS=("32" "33" "33" "32" "35" "34" "36" "1;31" "1;34" "1;35" "1;36" "1;32" "1;33" "1;31" "1;35" "1;36" "1;32" "1;33" "1;31" "1;35" "1;36" "1;32" "1;33")
ASCII_ART_URL="https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/txt/pkg.txt"  # URL to your ASCII art file
NAMES=()  # Initialize an empty array for step names

# Fetch the ASCII art file from the URL and add it to the NAMES array
ascii_art_text=$(curl -s "$ASCII_ART_URL")
while IFS= read -r line; do
  if [ -n "$line" ]; then
    # Replace % with spaces in each line
    line="${line//\%/ }"
    name=""
    for ((i = 0; i < 3; i++)); do
      read -r next_line
      next_line="${next_line//\%/ }"
      name="$name$next_line\n"
    done
    NAMES+=("$name")
  fi
done <<< "$ascii_art_text"

# Automatically calculate the number of steps
NUM_STEPS=${#NAMES[@]}

setup () {
  for ((i = 0; i < NUM_STEPS; i++)); do
    color_code="\033[${COLORS[$i]}m"
    name=${NAMES[$i]}
    clear
    printf "\n\n   $color_code$name \033[0m\n\n"
       
    case $i in
      0)
        apt update -y
        ;;
      1)
        apt upgrade
        ;;
      2)
        apt install python -y
        ;;
      3)
        apt install figlet -y
        ;;
      4)
        apt install git -y
        ;;
      5)
        apt install wget -y
        ;;
      6)
        apt install zsh -y
        ;;
      7)
        apt install curl -y
        ;;
      8)
        apt install lsd -y
        ;;
      9)
        apt install micro -y
        ;;
      10)
        pkg install zip -y
        ;;
      11)
        pkg install logo-ls -y
        ;;
      12)
        pkg install ruby -y
        ;;
      13)
        gem install lolcat
        ;;
      14)
        curl -sL https://raw.githubusercontent.com/bajrangCoder/acode-plugin-acodex/main/installServer.sh | bash
        ;;
      15)
        pkg install openssh
        ;;
    esac
    sleep 1
    clear
  done
  
  cd $PREFIX/bin
  rm -rf zsh2
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> zsh2
  echo "bash ~/x-theme/zsh.sh" >> zsh2
  chmod 777 zsh2
  rm -rf add
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> add
  echo "bash ~/.termux/add.sh" >> add
  chmod 777 add
  rm -rf e
  echo "#!/data/data/com.termux/files/usr/bin/sh" >> e
  echo "killall -9 com.termux" >> e
  chmod 777 e
  bash ~/x-theme/zsh.sh
  

  printf "\n\n\033[0;33m   Now you can use\033[0m:- \033[0;31m zsh2\033[0m\n"
  printf "  \033[0;33m Now you can use to create alias\033[0m:- \033[0;31m add\033[0m\n"
}

setup
