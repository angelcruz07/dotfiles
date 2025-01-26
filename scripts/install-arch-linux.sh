#!/bin/bash

set -e

# Define colors for output using tput for better compatibility
PINK=$(tput setaf 204)
PURPLE=$(tput setaf 141)
GREEN=$(tput setaf 114)
ORANGE=$(tput setaf 208)
BLUE=$(tput setaf 75)
YELLOW=$(tput setaf 221)
RED=$(tput setaf 196)
NC=$(tput sgr0) # No Color

USER_HOME=$(eval echo ~${SUDO_USER})

echo -e "${GREEN}Welcome to the AlexCode auto installation${NC}"

sudo -v

while true; do
  sudo -n true
  sleep 60
  kill - "$$" || exit
done 2>/dev/null &

select_option() {
  local prompt_message="$1"
  shift
  local options=("$@")
  PS3="${ORANGE}$prompt_message${NC} "
  select opt in "${options[@]}"; do
    if [ -n "$opt" ]; then
      echo "$opt"
      break
    else
      echo -e "${RED}Invalid option. Please try again.${NC}"
    fi
  done
}

# Function to prompt user for input
prompt_user() {
  local prompt_message="$1"
  local default_answer="$2"
  read -p "$(echo -e ${BLUE}$prompt_message [$default_answer]${NC}) " user_input
  user_input="${user_input:-$default_answer}"
  echo "$user_input"
}

# Function to display a spinner
spinner() {
  local pid=$!
  local delay=0.1
  local spinstr='|/-\'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

# Function to check and create directories if they do not exist
ensure_directory_exists() {
  local dir_path="$1"
  local create_templates="$2"

  if [ ! -d "$dir_path" ]; then
    echo -e "${YELLOW}Directory $dir_path does not exist. Creating...${NC}"
    mkdir -p "$dir_path"
  else
    echo -e "${GREEN}Directory $dir_path already exists.${NC}"
  fi

  # Check for the "templates" directory only if create_templates is true
  if [ "$create_templates" == "true" ]; then
    if [ ! -d "$dir_path/templates" ]; then
      echo -e "${YELLOW}Templates directory does not exist. Creating...${NC}"
      mkdir -p "$dir_path/templates"
      echo -e "${GREEN}Templates directory created at $dir_path/templates${NC}"
    else
      echo -e "${GREEN}Templates directory already exists at $dir_path/templates${NC}"
    fi
  fi
}

# Function to run commands with optional suppression of output
run_command() {
  local command=$1
  if [ "$show_details" = "Yes" ]; then
    eval $command
  else
    eval $command &>/dev/null
  fi
}

# Function to install basic dependencies for Arch Linux
install_dependencies() {
  run_command "sudo pacman -Syu --noconfirm"
  run_command "sudo pacman -S --needed --noconfirm base-devel curl file git wget"
  run_command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  run_command ". $HOME/.cargo/env"

}

install_homebrew_with_progress() {
  local install_command="$1"

  echo -e "${YELLOW}Installing Homebrew...${NC}"

  if [ "$show_details" = "No" ]; then
    # Run installation in the background and show progress
    (eval "$install_command" &>/dev/null) &
    spinner
  else
    # Run installation normally
    eval "$install_command"
  fi
}

# Function to install Homebrew if not installed
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo -e "${YELLOW}Homebrew is not installed. Installing Homebrew...${NC}"

    if [ "$show_details" = "No" ]; then
      # Show progress bar while installing Homebrew
      install_homebrew_with_progress "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
      spinner
    else
      # Install Homebrew normally
      run_command "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    fi

    # Add Homebrew to PATH based on OS
    if [ "$os_choice" = "mac" ]; then
      run_command "(echo 'eval \"\$(/opt/homebrew/bin/brew shellenv)\"' >> $USER_HOME/.zshrc)"
      run_command "(echo 'eval \"\$(/opt/homebrew/bin/brew shellenv)\"' >> $USER_HOME/.bashrc)"
      run_command "mkdir -p $USER_HOME/.config/fish"
      run_command "(echo 'eval \"\$(/opt/homebrew/bin/brew shellenv)\"' >> $USER_HOME/.config/fish/config.fish)"
      run_command "eval \"\$(/opt/homebrew/bin/brew shellenv)\""
    elif [ "$os_choice" = "linux" ]; then
      run_command "(echo 'eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"' >> ~/.zshrc)"
      run_command "(echo 'eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"' >> ~/.bashrc)"
      run_command "mkdir -p ~/.config/fish"
      run_command "(echo 'eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"' >> ~/.config/fish/config.fish)"
      run_command "eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\""
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
    awk -v search="$search" -v replace="$replace" '
    $0 ~ search {print replace; next}
    {print}
    ' "$file" >"${file}.tmp" && mv "${file}.tmp" "$file"
  else
    echo "$replace" >>"$file"
  fi
}

# Ask if the user wants to see detailed output
show_details="Yes"

os_choice=$(select_option "Are you sure this is on a clean Arch installation? " "yes" "no")

if [ "$os_choice" = "yes" ]; then
  # Install basic dependencies with progress bar
  echo -e "${YELLOW}Installing basic dependencies...${NC}"
  if [ "$show_details" = "No" ]; then
    install_dependencies &
    spinner
  else
    install_dependencies
  fi
elif [ "$os_choice" = "no" ]; then
  echo -e "${RED}It is not possible to continue without a clean Arch installation.${NC}"
  exit 1
else
  echo -e "${RED}Invalid choice. Exiting.${NC}"
  exit 1

fi

# Function to clone repository with progress bar
clone_repository_with_progress() {
  local repo_url="$1"
  local clone_dir="$2"
  local progress_duration=$3

  echo -e "${YELLOW}Cloning repository...${NC}"

  if [ "$show_details" = "No" ]; then
    # Run clone command in the background and show progress
    (git clone "$repo_url" "$clone_dir" &>/dev/null) &
    spinner "$progress_duration"
  else
    # Run clone command normally
    git clone "$repo_url" "$clone_dir"
  fi
}

# Step 1: Clone the Repository
echo -e "${YELLOW}Step 1: Clone the Repository${NC}"
if [ -d "Gentleman.Dots" ]; then
  echo -e "${GREEN}Repository already cloned. Overwriting...${NC}"
  rm -rf "AlexCode Dots"
fi
clone_repository_with_progress "https://github.com/angelcruz07/dotfiles.git" "AlexCode Dots" 20
cd Gentleman.Dots || exit
