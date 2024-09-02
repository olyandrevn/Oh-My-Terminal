#!/bin/bash

# Function to update system based on OS type
update_system() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Updating system for Linux..."
    sudo apt update && sudo apt upgrade -y
    echo "Installing Zsh on Linux..."
    sudo apt install -y zsh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing brew system for macOS..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${HOME}/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Updating system for macOS..."
    brew update && brew upgrade
    echo "Installing Zsh on macOS..."
    brew install zsh
    brew install wget
    brew install --cask font-meslo-lg-nerd-font
  else
    echo "Unsupported OS type: $OSTYPE"
    exit 1
  fi
}

# Update package list and install Zsh
update_system

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Clone the Powerlevel10k theme repository
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Clone plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Copy configuration files
cp dotfiles/zshrc.conf ~/.zshrc
cp dotfiles/p10kzsh.conf ~/.p10k.zsh
cp dotfiles/vimrc.conf ~/.vimrc
cp dotfiles/aliases.conf ~/.bash_aliases

# Source the new Zsh configuration
source ~/.zshrc

