<div align="center">

# **My DotFiles**

<img src="https://raw.githubusercontent.com/Fadyio/Fadyio.com/main/static/img/logo.svg" height="400">
<div align="center">

![](https://img.shields.io/github/last-commit/Fadyio/Linux-dotfiles?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![](https://img.shields.io/github/stars/Fadyio/Linux-dotfiles?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
[![](https://img.shields.io/github/repo-size/Fadyio/Linux-dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)](https://github.com/Fadyio/Linux-dotfiles)


<br/>

## Screenshots
![Arch](/assets/Arch1.png)
![Arch](/assets/Arch2.png)
![Arch](/assets/Arch3.png)
![Arch](/assets/Arch4.png)
![Arch](/assets/Arch5.png)
![Arch](/assets/Arch6.png)
![Anki](/assets/Anki.png)

</div>


# Details
 **OS**: [Arch Linux](https://archlinux.org)

 **Bar**: [i3status-rust](https://github.com/greshake/i3status-rust)

 **Notifications**: [dunst](https://github.com/dunst-project/dunst)

 **Wallpaper Loader**: [Feh](https://feh.finalrewind.org)

 **Terminal**: [Alacritty](https://alacritty.org/)

 **Search menu**: [Ulauncher](https://ulauncher.io/)

 **Fetch script**: [neofetch](https://github.com/dylanaraps/neofetch)

 **Browser**: [Firefox](https://www.mozilla.org/en-US/firefox/new/?redirect_source=firefox-com)

 **Font**: [Nerd Font](https://www.nerdfonts.com/)

 **Theme and Wallpaper** [catppuccin](https://github.com/catppuccin/catppuccin)


I use  [GNU Stow](https://www.gnu.org/software/stow/) to Manage My Dotfiles.

It includes my `zsh`, `tmux`, `git`, `i3` , ... config files.

## How to use

**Use `gnu-stow` to link the files.**

For example if you need my `zsh` config clone the repo then inside the repo use:

`stow .zsh .zshrc`

This will symlink the necessary files.

```
git clone --recursive https://github.com/fady0/Linux-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```
<p align="right">(<a href="#top">back to top</a>)</p>
