#!/bin/bash
#######################################
# Bash script to install apps on a new system (Arch Linux)
# Written by @Fadyio from http://Fadyio.com
# Email:me@Fadyio.com
#######################################

## Update packages and Upgrade system

function updatePacman() {

	echo "==================================="
	echo "update Pacman packages and Installing Yay AUR Helper "
	echo "==================================="
	## update the system  with pacman
	sudo pacman -Syu
	## install the base-devel packages
	sudo pacman -S --needed base-devel
	## install git
	sudo pacman -S git
	## install yay aur Helper
	sudo git clone https://aur.archlinux.org/yay.git
	sudo chown -R f0dy:f0dy yay
	cd yay
	makepkg -si
	yay -Syu
	cd ~
}

function installPacmanPackages() {

	echo "=================================="
	echo "Installing Arch packages:"
	echo "=================================="

	cd ~/.dotfiles/programs

	sudo pacman -S --needed - <pkglist-repo.txt

	for x in $(<pkglist-aur.txt); do yay -S $x; done

}

function installNpmPackages() {

	echo "==================================="
	echo "Installing global npm packages"
	echo "==================================="

	cd ~/
	npm install -g alacritty-themes
	npm install -g prettier_d_slim
	npm install -g markdownlint-cli
	npm install -g write-good
	npm install -g eslint_d
	npm install -g markdownlint
	npm install -g fixjson

}

function installPythonPackages() {

	echo "==================================="
	echo "Installing Python packages"
	echo "==================================="

	cd ~/

	pip3 install codespell
	pip3 install cmakelang
	pip3 install sqlfluff
	pip3 install yapf
	pip3 install flake8
	pip3 install gitlint
	pip3 install semgrep
	pip3 install proselint
	pip3 install "ansible-lint"
	pip3 install curlylint
	pip3 install --user yamllint
	pip3 install isort
}

function cloneDotfiles() {

	echo "==================================="
	echo "Cloning dotfiles and stow them"
	echo "==================================="

	## clone my dotfiles repository
	cd ~/
	mkdir -p .dotfiles
	git clone --recurse-submodules -j8 https://github.com/fadyio/Linux-dotfiles.git ~/.dotfiles
	cd .dotfiles
	stow .
}

function setupNvim() {
	echo "==================================="
	echo "Setting up vim and neovim"
	echo "==================================="

	cd ~/
	mkdir -p ~/github
	git clone https://github.com/fadyio/nvim.git ~/github

	# Link init.lua for neovim
	ln -sf ~/github/nvim ~/.config/

	# Install vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo "==================================="
	echo "Once this process is complete open vim and run :PlugInstall"
	echo "Once this process is complete open Neovim and packer will install the everything for you"
	echo "==================================="

}

function install() {

	echo "==================================="
	echo "Beginning Installation..."
	echo "==================================="
	#
	updatePacman
	installPacmanPackages
	installNpmPackages
 	installPythonPackages
 	cloneDotfiles
 	setupNvim
}

install
