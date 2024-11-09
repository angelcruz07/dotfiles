# Nvim

My configuration is based on this repository:
[Gentleman Programming](https://github.com/Gentleman-Programming/Gentleman.Dots.git)
with some personal changes.
In this guide, you will be able to set up my configuration.

## Installation

The configuration is based on LazyVim and customized, so you will need to have NeoVim
and LazyVim installed.

Refer to the documentation [neovim](https://neovim.io) [lazyvim](http://www.lazyvim.org/installation)

Once NeoVim and LazyVim are installed, you can run the following commands in your terminal.

### Install Homebrew

This is a package manager for macOS and Linux that will allow you to install many packages and tools easily and always keep them up to date.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Include Homebrew in your shell profile.

```bash
# Replace 'YourUserName' with your device's username

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/YourUserName/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Now we need to install the necessary packages to compile software and some dependencies

```bash
sudo pacman -Syu

sudo pacman -S base-devel
```

## Install nvim

We will install nvim using Homebrew.

```bash
brew install nvim
```

### Install Node and NPM

```bash
brew install node
brew install npm
```

### Install Git

We need git to clone my repository

```bash

brew install git
```

### Install fish

```bash

brew install fish

# Set it as default

which fish

# This will return a path, let's call it whichFishResultingPath

# Add it as an available shell

echo whichFishResultingPath | sudo tee -a /etc/shells

# Set it as default

sudo chsh -s whichFishResultingPath
```

### Install Oh My Fish

```bash
curl <https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install> | fish
```

### Install the following dependencies to run LazyVim

```bash
brew install gcc
brew install fzf
brew install fd
brew install ripgrep
```

### Install Zellij

This is a terminal multiplexer, allowing you to split your terminal
into multiple panes and run multiple commands simultaneously.

```bash
brew install zellij
```

### Clone my repository

```bash
git clone <https://github.com/angelcruz07/dotfiles.git>
```

### Copy my configuration

Copy my configuration from the repository you just cloned

```bash
cp -r ~/dotfiles/AlexcodeNvim/nvim ~/.config/
```

At this point, you will have my configuration, but we can still improve it.
You can continue with the following installations.

### Install Zsh

```bash
brew install zsh
```

### Install Oh My Zsh

```bash
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete
```

### Copy my Zsh configuration

```bash
cp ~/dotfiles/AlexcodeDesktop/.zshrc ~/
```
