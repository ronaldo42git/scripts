#!/bin/bash

# Function to display status messages
function show_message() {
    echo -e "\n$1\n"
}

# Updating package database and system
show_message "Updating package database and system with pacman..."
sudo pacman -Syyu --noconfirm

# Installing necessary packages with pacman
show_message "Installing necessary packages with pacman..."
sudo pacman -S --noconfirm base-devel jdk-openjdk openssl ctags ncurses htop neofetch gedit keepassxc ufw git vim curl imagemagick fontconfig

# Installing yay (AUR helper)
show_message "Installing yay (AUR helper)..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

# Installing Docker using yay
show_message "Installing Docker with yay..."
yay -Syy --noconfirm
yay -S --noconfirm docker

# Completion message
show_message "Installation completed!"

