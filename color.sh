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
  printf "\n   💠 ${GREEN}mv to .buk${NC}\n\n"
  termux-reload-settings
}

# #!/bin/bash

# ... (other code remains the same)
#!/bin/bash

menu() {
  local options=("aci" "aco" "azu" "bim" "cai" "chalk" "default" "dracula" "elementary" "elic" "eloi" "flat" "freya" "gruvbox.dark" "hemisu.dark" "hemisu.light" "hybrid" "jup" "mar" "material" "material.ocean" "miu" "monikai.dark" "nep" "ocean.dark" "onr.dark" "one.light" "pali" "peppermint" "sat" "shel" "smyck" "saazzy" "solarized.dark" "solarized.light" "tango" "tin" "tomorrow" "tomorrow.night.blue" "tomorrow.night.bright" "tomorrow.night" "tomorrow.night.eighties" "ura" "vag" "Back" "Exit")

  # Calculate the number of blank lines before the second line (adjust as needed)
  lines_before=8

  for ((i = 0; i < lines_before; i++)); do
    printf ""
  done
  
  clear
  printf "\n$color_code$name \033[0m\n"
  printf "      ${YELLOW}==========${NC}${GREEN} [Add a colors] ${NC}${YELLOW}=========${NC}\n"
  printf "        ${RED}================================${NC}\n\n"

  columns=2  # Number of columns (changed from 3 to 2)
  items_per_column=$(( (${#options[@]} + $columns - 1) / $columns ))
  max_option_length=0

  # Find the maximum length of option names
  for option in "${options[@]}"; do
    length=${#option}
    if [ "$length" -gt "$max_option_length" ]; then
      max_option_length="$length"
    fi
  done

  for ((i = 0; i < $items_per_column; i++)); do
    for ((j = 0; j < $columns; j++)); do
      index=$(( $i + $j * $items_per_column ))
      if [ $index -lt ${#options[@]} ]; then
        option="${options[index]}"
        printf " \033[1;92m[$(printf "%02d" $((index+1)))]\033[1;93m %-$(($max_option_length + 2))s" "$option"
       #printf " \033[1;92m[$(printf "%02d" $((index+1)))]\033[1;93m ${options[index]}\t"
      fi
    done
    printf "\n"
  done

  printf "\n\033[1;96mEnter the number select (1-${#options[@]}): "

  read choice

  if [ "$choice" -ge 1 ] && [ "$choice" -le ${#options[@]} ]; then
    if [ "${options[choice-1]}" == "Back" ]; then
      bash ~/x-theme/zsh.sh  # Restart the script
    elif [ "${options[choice-1]}" == "Exit" ]; then
      exit
    else
      install_zsh_theme "${options[choice-1]}"
    fi
  else
    printf "\nInvalid choice. Please enter a valid number.\n\n"
    menu
  fi
}
menu
clear
bash ~/x-theme/color.sh
