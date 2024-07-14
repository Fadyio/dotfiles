#!/bin/env bash

# Update the system
sudo pacman -Syu
sudo pacman -S git ansible base-devel --noconfirm

# Clone the repository

git clone --depth=1 --recurse-submodules https://github.com/Fadyio/dotfiles.git ~/.dotfiles

# Run the playbook
cd ~/.dotfiles/Ansible
ansible-playbook playbook.yml