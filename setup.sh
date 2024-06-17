#!/bin/bash

# Update package list and install Zsh
sudo apt update
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Clone the Powerlevel10k theme repository
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Copy configuration files
cp dotfiles/zshrc.conf ~/.zshrc
cp dotfiles/p10kzsh.conf ~/.p10k.zsh

# Source the new Zsh configuration
source ~/.zshrc

