# My Dotfiles


<div align="center">
<img src="https://raw.githubusercontent.com/Fadyio/Fadyio.com/refs/heads/main/public/static/logo.svg" height="400">

![](https://img.shields.io/github/last-commit/Fadyio/dotfiles?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![](https://img.shields.io/github/stars/Fadyio/dotfiles?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
[![](https://img.shields.io/github/repo-size/Fadyio/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)](https://github.com/Fadyio/dotfiles)


</div>

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

**Search menu**: [Ulauncher](https://ulauncher.io/)

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


## Contributing

Contributions are welcome! Please open an issue or submit a pull request.


<p align="right">(<a href="#top">back to top</a>)</p>