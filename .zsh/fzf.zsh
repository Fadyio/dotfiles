#!/usr/bin/zsh
################################################################################
#    Author: Fady                                                              #
#     Email: Fady@Fadyio.com                                                   #
################################################################################
[[ $- != *i* ]] && return

if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
else
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh   ] && source /usr/share/fzf/completion.zsh
fi
#######################################################################

FZF_FILE_HIGHLIGHTER='bat'
(( $+commands[rougify]   )) && FZF_FILE_HIGHLIGHTER='rougify'
(( $+commands[coderay]   )) && FZF_FILE_HIGHLIGHTER='coderay'
(( $+commands[highlight] )) && FZF_FILE_HIGHLIGHTER='highlight -lO ansi'
(( $+commands[bat]       )) && FZF_FILE_HIGHLIGHTER='bat --color=always'
export FZF_FILE_HIGHLIGHTER


FZF_DIR_HIGHLIGHTER='ls -l --color=always'
(( $+commands[tree] )) && FZF_DIR_HIGHLIGHTER='tree -CtrL2'
(( $+commands[exa]  )) && FZF_DIR_HIGHLIGHTER='exa --color=always -TL2'
(( $+commands[lsd]  )) && FZF_DIR_HIGHLIGHTER='lsd --color=always --tree --depth=2'
export FZF_DIR_HIGHLIGHTER

FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD ||
         find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
(( $+commands[ag] )) && FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g "" 2>/dev/null'
(( $+commands[fd] )) && FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null'
export FZF_DEFAULT_COMMAND
FZF_DEFAULT_OPTS="
--exact
--prompt '❯ '
--pointer '➤'
--marker '┃'
--border
--color=fg:-1,bg:-1,hl:#ffaf5f,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=prompt:#5fff87,marker:#ff87d7,spinner:#ff87d7
--info inline
--height 80%
--extended
--ansi
--reverse
--cycle
--bind alt-p:preview-up,alt-n:preview-down
--bind alt-k:preview-up,alt-j:preview-down
--bind ctrl-u:half-page-up,ctrl-d:half-page-down
--bind alt-a:select-all,ctrl-r:toggle-all
--bind ctrl-s:toggle-sort
--bind ?:toggle-preview,alt-w:toggle-preview-wrap
--bind \"ctrl-y:execute-silent(ruby -e 'puts ARGV' {+} | pbcopy)+abort\"
--bind 'alt-e:execute($EDITOR {} >/dev/tty </dev/tty)'
--bind change:top
--preview \"($FZF_FILE_HIGHLIGHTER {} || $FZF_DIR_HIGHLIGHTER {}) 2>/dev/null | head -200\"
--preview-window right:60%:hidden
"
export FZF_DEFAULT_OPTS
export FZF_COMPLETION_TRIGGER='~~'
(( $+commands[fd] )) && {
    _fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }
    _fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }
}

# FZF: Ctrl - T
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND
FZF_CTRL_T_OPTS="
--preview \"($FZF_FILE_HIGHLIGHTER {} || $FZF_DIR_HIGHLIGHTER {}) 2>/dev/null | head -200\"
--bind 'enter:execute(echo {})+abort'
--bind 'alt-e:execute($EDITOR {} >/dev/tty </dev/tty)'
--preview-window default:right:60%
"
export FZF_CTRL_T_OPTS

# FZF: Alt - C
FZF_ALT_C_COMMAND="command find -L . -mindepth 1 \
    \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
    -prune -o -type d -print 2> /dev/null | cut -b3-"
(( $+commands[fd]      )) && FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git 2>/dev/null'
(( $+commands[blsd]    )) && FZF_ALT_C_COMMAND='blsd $dir | grep -v "^\.$"'
export FZF_ALT_C_COMMAND
export FZF_ALT_C_OPTS="
--exit-0
--preview '($FZF_DIR_HIGHLIGHTER {}) | head -200 2>/dev/null'
--preview-window=right:50%
"

# FZF: Alt - E
FZF_ALT_E_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_E_COMMAND
FZF_ALT_E_OPTS="
--preview \"($FZF_FILE_HIGHLIGHTER {} || $FZF_DIR_HIGHLIGHTER {}) 2>/dev/null | head -200\"
--bind 'alt-e:execute($EDITOR {} >/dev/tty </dev/tty)'
--preview-window default:right:60%
"
export FZF_ALT_E_OPTS

function Rg() {
    local SELECTED
    SELECTED=$(rg --column --line-number --no-heading --color=always --smart-case "$1" |
        fzf --ansi \
            --delimiter : \
            --no-multi \
            --bind 'alt-e:execute($EDITOR +{2} {1} >/dev/tty </dev/tty)' \
            --preview 'bat --style=numbers,header,changes,snip --color=always --highlight-line {2} {1}' \
            --preview-window 'default:right:60%:~1:+{2}+3/2:border-left'
    ) && $EDITOR +$(cut -d: -f2 <<<$SELECTED) $(cut -d: -f1 <<<$SELECTED)
}
bindkey -s '\eg' 'Rg^M'

function RG() {
    local RG_PREFIX INITIAL_QUERY SELECTED
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="$1"
    SELECTED=$(FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' || true" \
        fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --disabled --query "$INITIAL_QUERY" \
        --delimiter : \
        --bind 'alt-e:execute($EDITOR +{2} {1} >/dev/tty </dev/tty)' \
        --preview 'bat --style=numbers,header,changes,snip --color=always --highlight-line {2} {1}' \
        --preview-window 'default:right:60%:~1:+{2}+3/2:border-left'
    ) && $EDITOR +$(cut -d: -f2 <<<$SELECTED) $(cut -d: -f1 <<<$SELECTED)
}

# Install packages using yay (change to pacman/AUR helper of your choice)
function install() {
    paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S
}
# Remove installed packages (change to pacman/AUR helper of your choice)
function remove() {
    paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}


fman() {
  batman="man {1} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
   man -k . | sort \
   | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue;} 1' \
   | fzf  \
      -q "$1" \
      --ansi \
      --tiebreak=begin \
      --prompt=' Man > '  \
      --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
      --preview "${batman}" \
      --bind "enter:execute(man {1})" \
      --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
      --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
      --bind "alt-t:+change-preview(tldr --color=always {1})+change-prompt(ﳁ TLDR > )"
}
zle -N fman

# fcd - including hidden directories
fcd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
