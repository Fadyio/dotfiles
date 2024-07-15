#!/bin/env bash

# Update the system
sudo pacman -Syu
sudo pacman -S git ansible base-devel --noconfirm

# Clone the repository

git clone --depth=1 --recurse-submodules https://github.com/Fadyio/dotfiles.git ~/.dotfiles

# Build and install paru
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -si


# Run the playbook
cd ~/.dotfiles/Ansible
ansible-galaxy collection install kewlfft.aur
ansible-playbook playbook.yml
