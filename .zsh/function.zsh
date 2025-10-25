#!/usr/bin/zsh

# Check if the shell is not interactive and return if true
[[ $- != *i* ]] && return

# Initialization Mode for Zsh vi mode to work with Atuin
# see: https://github.com/jeffreytse/zsh-vi-mode/issues/297
ZVM_INIT_MODE=sourcing

# FZF configuration
export FZF_DEFAULT_OPTS="
  --exact
  --prompt ' '
  --pointer '󰁕'
  --marker '󰄲 '
  --border
  --color=fg:-1,bg:-1,hl:#ffaf5f,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=prompt:#5fff87,marker:#ff87d7,spinner:#ff87d7
  --extended
  --reverse
  --cycle
  --preview 'bat --style=numbers --color=always --line-range :500 {}'
  --preview-window='right:60%'
"

# Set default command for file searching
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

# Use fd for FZF if available
(( $+commands[fd] )) && {
    _fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }
    _fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }
}

# Install packages using paru or brew on macOS
function install() {
    if [[ "$(uname)" == "Darwin" ]]; then
        brew search "$1" | fzf --preview 'brew info {1}' | awk '{print $1}' | xargs -o brew install
    elif [[ "$(uname)" == "Linux" ]]; then
        paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}' | awk '{print $1}' | xargs -o paru -S
    else
        echo "Unsupported operating system"
    fi
}

# Remove installed packages using paru
function remove() {
    if [[ "$(uname)" == "Darwin" ]]; then
        brew list | fzf --preview 'brew info {1}' | xargs -o brew uninstall
    elif [[ "$(uname)" == "Linux" ]]; then
        paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | awk '{print $1}' | xargs -o paru -Rns
    else
        echo "Unsupported operating system"
    fi
}

# Upgrade packages
function upgrade() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        paru -Syu
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew update && brew upgrade && brew cleanup
    else
        echo "Unknown operating system."
    fi
}

# Kill processes using fzf
function fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi
    if [ -n "$pid" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# yazi function
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(bat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ex - archive extractor
# usage: ex <file>
function ex() {
    if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.tar.xz) tar xf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Navigate up directories
function up() {
    local d=""
    for ((i=1; i<=$1; i++)); do
        d="../$d"
    done
    cd "$d"
}

# gitignore.io completion
function gi() { curl -fLw '\n' https://www.toptal.com/developers/gitignore/api/"${(j:,:)@}" }

_gitignoreio_get_command_list() {
  curl -sfL https://www.toptal.com/developers/gitignore/api/list | tr "," "\n"
}

_gitignoreio () {
  compset -P '*,'
  compadd -S '' `_gitignoreio_get_command_list`
}

compdef _gitignoreio gi

