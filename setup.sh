#!/bin/bash

# Backup existing files
mkdir -p ~/dotfiles-backup
cp ~/.bashrc ~/.bash_profile ~/.profile ~/.bash_aliases ~/dotfiles-backup 2>/dev/null
cp -r ~/.config ~/dotfiles-backup/config-backup 2>/dev/null

# Copy dotfiles
cp ~/dotfiles/.bashrc ~/
cp -r ~/dotfiles/.config/* ~/.config/

# Install packages
sudo pacman -Syu --needed - < ~/dotfiles/packages.txt
yay -S --needed - < ~/dotfiles/aur-packages.txt
