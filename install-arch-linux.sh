#!/bin/bash

set -e

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

USER_HOME=$(eval echo ~${SUDO_USER})

echo -e "${GREEN}Welcome to the AlexCode installation and configuration guide!${NC}"

# Function to prompt user for input
prompt_user() {
  local prompt_message="$1"
  local default_answer="$2"
  read -p "$prompt_message [$default_answer] " user_input
  user_input="${user_input:-$default_answer}"
  echo "$user_input"
}

# Function to install basic dependencies for Arch Linux
install_dependencies() {
  if [ "$os_choice" = "linux" ]; then
    # Update the package database
    sudo pacman -Syu --noconfirm

    # Install the necessary packages
    sudo pacman -S --noconfirm base-devel curl file git
  fi
}

# Function to install Homebrew if not installed

install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo -e "${YELLOW}Homebrew is not installed. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH based on OS
    if [ "$os_choice" = "mac" ]; then
      (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
      ) >>$USER_HOME/.zshrc
      (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
      ) >>$USER_HOME/.bashrc
      mkdir -p $USER_HOME/.config/fish
      (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
      ) >>$USER_HOME/.config/fish/config.fish
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ "$os_choice" = "linux" ]; then
      if [ -d "/home/linuxbrew/.linuxbrew" ]; then
        (
          echo
          echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
        ) >>$USER_HOME/.zshrc
        (
          echo
          echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
        ) >>$USER_HOME/.bashrc
        mkdir -p $USER_HOME/.config/fish
        (
          echo
          echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
        ) >>$USER_HOME/.config/fish/config.fish
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      else
        echo -e "${RED}Homebrew installation directory not found. Please check the installation.${NC}"
      fi
    fi
  else
    echo -e "${GREEN}Homebrew is already installed.${NC}"
  fi
}

# Function to update or replace a line in a file
update_or_replace() {
  local file="$1"
  local search="$2"
  local replace="$3"

  if grep -q "$search" "$file"; then
    # Use awk to replace the line containing the search string
    awk -v search="$search" -v replace="$replace" '
    $0 ~ search {print replace; next}
    {print}
    ' "$file" >"${file}.tmp" && mv "${file}.tmp" "$file"
  else
    echo "$replace" >>"$file"
  fi
}

# Function to set the default shell
set_default_shell() {
  local shell_path="$1"

  if ! grep -Fxq "$shell_path" /etc/shells; then
    echo "$shell_path" | sudo tee -a /etc/shells
  fi

  sudo chsh -s "$shell_path" "$USER"
}

# Ask for the operating system
os_choice=$(prompt_user "Which operating system are you using? (Options: mac, linux)" "none")

# Install basic dependencies
install_dependencies

PROJECT_PATHS=$(prompt_user "Enter the path for your projects" "/your/work/path/")

# Step 1: Clone the Repository
echo -e "${YELLOW}Step 1: Clone the Repository${NC}"
if [ -d "dotfiles" ]; then
  echo -e "${GREEN}Repository already cloned. Skipping...${NC}"
else
  git clone https://github.com/angelcruz07/dotfiles.git
fi
cd dotfiles || exit

# Install Homebrew if not installed
install_homebrew

# Terminal Emulators Installation
echo -e "${YELLOW}Step 2: Choose and Install Terminal Emulator${NC}"
if is_wsl; then
  echo -e "${YELLOW}You are running WSL. Terminal emulators should be installed on Windows.${NC}"
else
  if [ "$os_choice" = "linux" ]; then
    echo -e "${YELLOW}Note: Kitty is available for Linux, but we will adapt the script accordingly.${NC}"
    term_choice=$(prompt_user "Which terminal emulator do you want to install? (Options: alacritty, wezterm, kitty)" "none")
  else
    term_choice=$(prompt_user "Which terminal emulator do you want to install? (Options: alacritty, wezterm, kitty)" "none")
  fi
  case "$term_choice" in
  "alacritty")
    if ! command -v alacritty &>/dev/null; then
      if [ "$os_choice" = "mac" ]; then
        brew install --cask alacritty
      elif [ "$os_choice" = "linux" ]; then
        sudo pacman -Syu alacritty
      fi
    else
      echo -e "${GREEN}Alacritty is already installed.${NC}"
    fi
    echo -e "${YELLOW}Configuring Alacritty...${NC}"
    mkdir -p ~/.config/alacritty
    cp alacritty.toml ~/.config/alacritty/alacritty.toml
    ;;
  "wezterm")
    if ! command -v wezterm &>/dev/null; then
      if [ "$os_choice" = "mac" ]; then
        brew install --cask wezterm
      elif [ "$os_choice" = "linux" ]; then
        sudo pacman -Syu wezterm
      fi
    else
      echo -e "${GREEN}WezTerm is already installed.${NC}"
    fi
    echo -e "${YELLOW}Configuring WezTerm...${NC}"
    mkdir -p ~/.config/wezterm
    cp .wezterm.lua ~/.config/wezterm/wezterm.lua
    ;;
  "kitty")
    if ! command -v kitty &>/dev/null; then
      if [ "$os_choice" = "mac" ]; then
        brew install --cask kitty
      elif [ "$os_choice" = "linux" ]; then
        sudo pacman -Syu kitty
      fi
    else
      echo -e "${GREEN}Kitty is already installed.${NC}"
    fi
    echo -e "${YELLOW}Configuring Kitty...${NC}"
    mkdir -p ~/.config/kitty
    cp -r GentlemanKitty/* ~/.config/kitty
    ;;
  *)
    echo -e "${YELLOW}No terminal emulator will be installed or configured.${NC}"
    ;;
  esac
fi

# Shared Steps (macOS, Linux, or WSL)

# Step 3: Shell Configuration (Fish and Zsh)
