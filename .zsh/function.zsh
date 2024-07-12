#!/usr/bin/zsh
#  ╭──────────────────────────────────────────────────────────╮
#  │                 Author: Fady Nagh                        │
#  │                                                          │
#  │                 Email: Fady@Fadyio.com                   │
#  │                                                          │
#  ╰──────────────────────────────────────────────────────────╯

# checks if the shell is not interactive and returns if true to prevent the script from running in non-interactive shells
[[ $- != *i* ]] && return



FZF_DEFAULT_OPTS="
--exact
--prompt '❯ '
--pointer '➤'
--marker '┃'
--border
--color=fg:-1,bg:-1,hl:#ffaf5f,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=prompt:#5fff87,marker:#ff87d7,spinner:#ff87d7
--extended
--reverse
--cycle
"
export FZF_DEFAULT_OPTS
export FZF_COMPLETION_TRIGGER='~~'

(( $+commands[fd] )) && {
    _fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }
    _fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }
}

# Ripgrep with live reload
function RG() {
    local RG_PREFIX INITIAL_QUERY SELECTED
    RG_PREFIX="rg --column --null --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="$1"
    SELECTED=$(FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' || true" \
        fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --disabled --query "$INITIAL_QUERY" \
        --delimiter : \
        --bind 'alt-e:execute($EDITOR +{2} {1} >/dev/tty </dev/tty)' \
        --preview 'bat --style=numbers,header,changes,snip --color=always --highlight-line {2} {1}' \
        --preview-window 'default:right:60%:~1:+{2}+3/2:border-left'
    ) && $EDITOR +$(cut -d: -f2 <<<"$SELECTED") $(cut -d: -f1 <<<"$SELECTED")
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

# Man page browser with fzf
function fman() {
    batman="man {1} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
    man -k . | sort \
        | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue;} 1' \
        | fzf \
            -q "$1" \
            --ansi \
            --tiebreak=begin \
            --prompt=' Man > ' \
            --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
            --preview "${batman}" \
            --bind "enter:execute(man {1})" \
            --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
            --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
            --bind "alt-t:+change-preview(tldr --color=always {1})+change-prompt(ﳁ TLDR > )"
}
zle -N fman

# Create a new directory and enter it
function mcd() {
    mkdir -p "$@" && cd "$_";
}

# Git log browser with fzf
function fglog() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
            (grep -o '[a-f0-9]\{7\}' | head -1 |
            xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
            {}
FZF-EOF"
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
