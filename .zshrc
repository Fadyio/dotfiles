# ── Tmux (must be first — exits outer shell) ─────────────────────────
if [[ -z "$TMUX" && -z "$VSCODE_RESOLVING_ENVIRONMENT" && -n "$PS1" ]]; then
    tmux attach-session -t 0 2>/dev/null || tmux new-session -s 0
    exit
fi

# ── Prompt ────────────────────────────────────────────────────────────
if [[ "$TERM_PROGRAM" != "Apple_Terminal" && -x "$(command -v oh-my-posh)" ]]; then
    eval "$(oh-my-posh init zsh --config ~/.ohmyposh.json)"
fi

# ── Environment ───────────────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GPG_TTY=$TTY
export GREP_COLORS="ms=01;31:mc=01;36:sl=:cx=:fn=01;35:ln=01;32:bn=01;32:se=01;33"
export MANPAGER="nvim +Man!"

# ── PATH ──────────────────────────────────────────────────────────────
export PNPM_HOME="$HOME/Library/pnpm"
typeset -gU path
path=(
    "$HOME/.local/bin"
    "${GOPATH:-$HOME/go}/bin"
    "$PNPM_HOME"
    $path
)
export PATH

# ── Shell Options ─────────────────────────────────────────────────────
setopt AUTO_CD EXTENDED_GLOB GLOB_DOTS COMPLETE_IN_WORD AUTO_LIST
unsetopt BEEP CORRECT_ALL

# ── Plugin Manager ───────────────────────────────────────────────────
ZPLUGINDIR="$HOME/.zplugins"
[[ ! -d "$ZPLUGINDIR" ]] && mkdir -p "$ZPLUGINDIR"

zplug_safe() {
    local repo="$1"
    local dir="$ZPLUGINDIR/${repo:t}"
    if [[ ! -d "$dir" ]]; then
        print -P "%F{33}▓▒░ Installing $repo...%f"
        git clone --depth=1 "https://github.com/$repo.git" "$dir"
    fi

    # Explicit file targeting is safer than pure globs
    if [[ -f "$dir/${repo:t}.plugin.zsh" ]]; then
        source "$dir/${repo:t}.plugin.zsh"
    elif [[ -f "$dir/${repo:t}.zsh" ]]; then
        source "$dir/${repo:t}.zsh"
    else
        local init=("$dir"/*.plugin.zsh(N) "$dir"/*.zsh(N))
        (( ${#init[@]} )) && source "${init[1]}"
    fi
}

# ── Completion System ────────────────────────────────────────────────
if [[ ! -d "$ZPLUGINDIR/zsh-completions" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-completions "$ZPLUGINDIR/zsh-completions"
fi
fpath=($ZPLUGINDIR/zsh-completions/src $fpath)

zmodload -i zsh/complist
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
    compinit -C
else
    compinit
fi
autoload -Uz bashcompinit && bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
complete -C '/usr/local/bin/aws_completer' aws
source <(kubectl completion zsh)
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# ── Plugins & UI (Strict Load Order Required) ─────────────────────────

zplug_safe "fadyio/tv-tab"
zplug_safe "zsh-users/zsh-autosuggestions"
zplug_safe "zdharma-continuum/fast-syntax-highlighting"

# Zoxide
[[ -x "$(command -v zoxide)" ]] && eval "$(zoxide init zsh --cmd cd)"

# 5. Vi-Mode & Atuin (Conflict Resolution)
# Vi-mode lazy-loads and wipes out external keybindings. We MUST use
# 'zvm_after_init' to load Atuin and custom binds so they survive the wipe.
function zvm_after_init() {
    [[ -x "$(command -v atuin)" ]] && eval "$(atuin init zsh)"

    # Ensure Delete key works in both Insert and Normal vi-modes
    bindkey "\e[3~" delete-char
    bindkey -a "\e[3~" delete-char
}
zplug_safe "jeffreytse/zsh-vi-mode"

# ── Aliases ───────────────────────────────────────────────────────────
alias c='clear'
alias v='nvim'
alias g='git'
alias cp='cp -riv'
alias mv='mv -iv'
alias rm='rm -i'
alias mkdir='mkdir -vp'
alias ls='eza --icons --color-scale-mode gradient --long --header --git --sort=extension'
alias gleaks='betterleaks detect --source . -v'
alias g-main='git checkout main && git pull && git fetch -p'
# ytvid implementation function (called via alias with noglob so arguments aren't globbed)
ytvid_impl() {
    yt-dlp --remote-components ejs:github -P ~/Downloads -ciw \
        --format 'bv*[height<=720][ext=mp4]+ba[ext=m4a]/bv*[height<=720]+ba/best' \
        --merge-output-format mp4 \
        --embed-chapters \
        --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction \
        --no-playlist \
        -o '%(title)s.%(ext)s' -- "$@"
}
# Alias that prefixes noglob so the shell doesn't attempt filename globbing on the URL before calling the function
alias ytvid='noglob ytvid_impl'
# ytlist implementation function (called via alias with noglob so arguments aren't globbed)
ytlist_impl() {
    yt-dlp --remote-components ejs:github -P ~/Downloads -ciw \
        --retries 20 --fragment-retries 10 --retry-sleep 3 --concurrent-fragments 4 \
        --format 'bv*[height<=720][ext=mp4]+ba[ext=m4a]/bv*[height<=720]+ba/best' \
        --embed-chapters --embed-metadata --embed-thumbnail \
        --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction \
        --sleep-requests 0.5 --sleep-interval 2 --max-sleep-interval 6 \
        -o '%(playlist|YouTube Videos)s/%(playlist_index)02d - %(title)s.%(ext)s' -- "$@"
}
# Alias that prefixes noglob so the shell doesn't attempt filename globbing on the URL before calling the function
alias ytlist='noglob ytlist_impl'

# ── Functions ─────────────────────────────────────────────────────────
chpwd() {
    if [[ -x "$(command -v eza)" ]]; then
        eza --icons --group-directories-first --color-scale all
    fi
}

gi() { curl -fLw '\n' https://www.toptal.com/developers/gitignore/api/"${(j:,:)@}" }

_gitignoreio() {
    local cache_file="$ZPLUGINDIR/gitignore_list.txt"
    if [[ ! -f "$cache_file" || -n "$cache_file"(#qN.m+7) ]]; then
        curl -sfL https://www.toptal.com/developers/gitignore/api/list | tr "," "\n" > "$cache_file" &!
    fi
    compset -P '*,'
    [[ -f "$cache_file" ]] && compadd -S '' $(cat "$cache_file")
}
compdef _gitignoreio gi
