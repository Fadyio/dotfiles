#!/bin/bash
#######################################
# Bash script to install apps on a new system (Arch Linux)
# Written by @Fadyio from http://Fadyio.com
# Email:me@Fadyio.com
# Copy the default config file if not present already
#######################################

################
# presentation #
################

echo -e "
${yellow}
          _ ._  _ , _ ._
        (_ ' ( \`  )_  .__)
      ( (  (    )   \`)  ) _)
     (__ (_   (_ . _) _) ,__)
           ~~\ ' . /~~
         ,::: ;   ; :::,
        ':::::::::::::::'
 ____________/_ __ \____________
|                               |
| Welcome to Fady Nagh dotfiles |
|_______________________________|
"

echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will delete all your configuration files!"
echo -e "${light_red}Use it at your own risks."

if [ $# -ne 1 ] || [ "$1" != "-y" ]; then
	echo -e "${yellow}Press a key to continue...\n"
	read key
fi

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
	yay -S --needed - <pkglist.txt
}

function installNpmPackages() {

	echo "==================================="
	echo "Installing global npm packages"
	echo "==================================="

	cd ~/
	npm install -g alacritty-themes
	npm install -g eslint_d
	npm install -g fixjson
	npm install -g sql-formatter

}

function installGOPackages() {

	echo "==================================="
	echo "Installing Go packages"
	echo "==================================="

	cd ~/
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1
	go install github.com/google/yamlfmt/cmd/yamlfmt@latest
	go install github.com/mgechev/revive@latest
	go install golang.org/x/tools/cmd/goimports@latest
	go install honnef.co/go/tools/cmd/staticcheck@latest
	luarocks install luacheck

}

function installPythonPackages() {

	echo "==================================="
	echo "Installing Python packages"
	echo "==================================="

	cd ~/

	pip3 install semgrep
	pip3 install autopep8
	pip3 install ueberzug
	pip3 install proselint
	pip3 install "ansible-lint"
	pip3 install "cfn-lint"
	pip3 install isort
	pip3 install cpplint
	pip3 install flake8
	pip3 install gitlint
	pip3 install yamllint
	pip3 install black
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
	installGOPackages
	installPythonPackages
	cloneDotfiles
	setupNvim
}

install
