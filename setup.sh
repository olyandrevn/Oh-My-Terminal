#!/bin/bash

# Update package list and install Zsh
sudo apt update
sudo apt install -y zsh

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

