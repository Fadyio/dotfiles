# My Dotfiles

<div align="center">
  <img alt="Logo" src="https://github.com/Fadyio/Fadyio.com/blob/main/public/static/logo.svg" height="200"/>
</div>

<p align="center">
  <a href="https://github.com/Fadyio/dotfiles/stargazers">
    <img
      alt="Stargazers"
      src="https://img.shields.io/github/stars/Fadyio/dotfiles?style=for-the-badge&logo=starship&color=c678dd&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Fadyio/dotfiles/issues">
    <img
      alt="Issues"
      src="https://img.shields.io/github/issues/Fadyio/dotfiles?style=for-the-badge&logo=gitbook&color=f0c062&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Fadyio/dotfiles/contributors">
    <img
      alt="Contributors"
      src="https://img.shields.io/github/contributors/Fadyio/dotfiles?style=for-the-badge&logo=opensourceinitiative&color=abcf84&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
    <a href="https://github.com/Fadyio/dotfiles">
    <img src="https://img.shields.io/github/repo-size/Fadyio/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" alt="Repo Size">
  </a>

  <img src="https://img.shields.io/github/last-commit/Fadyio/dotfiles?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" alt="Last Commit">
</p>

## Table of Contents

* [Screenshots](#screenshots)
* [Details](#details)
* [How to Use](#how-to-use)
* [Contributing](#contributing)


## Screenshots

![Arch](/Assets/Arch1.png)
![Arch](/Assets/Arch2.png)

## Details

**OS**: [Arch Linux](https://archlinux.org) And [Mac OS](https://www.apple.com/uk/macos/macos-sequoia)

**Bar**: [i3status-rust](https://github.com/greshake/i3status-rust)

**Notifications**: [dunst](https://github.com/dunst-project/dunst)

**Wallpaper Loader**: [Feh](https://feh.finalrewind.org)

**Terminal**: [Ghostty](https://ghostty.org)

**Search menu**: [Rofi](https://github.com/davatorium/rofi)

**Fetch script**: [neofetch](https://github.com/dylanaraps/neofetch)

**Font**: [Nerd Font](https://www.nerdfonts.com/)

**Theme and Wallpaper**: [catppuccin](https://github.com/catppuccin/catppuccin)


I use [GNU Stow](https://www.gnu.org/software/stow/) to manage my dotfiles.  It includes my `zsh`, `tmux`, `git`, `i3`, ... config files.

## How to Use

These instructions assume you have Git and GNU Stow installed.

1. **Clone the repository:**
   ```bash
   git clone --recursive https://github.com/fadyio/dotfiles.git ~/.dotfiles
   ```

2. **Navigate to the cloned directory:**
   ```bash
   cd ~/.dotfiles
   ```

3. **Install using Stow:**
   ```bash
   stow .
   ```
   This will symlink the necessary files into your home directory.  If you only want specific parts, you can use `stow .zsh .zshrc` to only install the zsh configuration.


## License

<p align="center"><a href="https://github.com/fadyio/dotfiles/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>

Copyright (c) 2025 [@Fadyio.com](https://fadyio.com).
