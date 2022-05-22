#    Zsh config by Fady Nagh 
#    Email: fadinagh0@gmail.com

export PATH="$HOME/.local/bin:$PATH"
# Save history so we get auto suggestions
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt appendhistory
setopt extendedglob local_options
setopt noglob

# Options
setopt auto_cd 									# cd by typing directory name if it's not a command
setopt auto_list 									# automatically list choices on ambiguous completion
setopt auto_menu 								# automatically use menu completion
setopt always_to_end 						# move cursor to end if word had one match
setopt hist_ignore_all_dups 				# remove older duplicate entries from history
setopt hist_reduce_blanks 				# remove superfluous blanks from history items
setopt inc_append_history 				# save history entries as soon as they are entered
setopt share_history 							# share historyetween different instances
unsetopt correct_all 								# stop autocorrect commands
setopt interactive_comments 			# allow comments in interactive shells

################# Plugins ####################
# zsh theme
source ~/.zshplugins/powerlevel10k/powerlevel10k.zsh-theme

# enable auto-notify 
source ~/.zshplugins/auto-notify/auto-notify.plugin.zsh

# zsh syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions for zsh
zinit load "zsh-users/zsh-autosuggestions"

zinit load z-shell/H-S-MW
# Simple zsh plugin that automatically sends out a notification when a long running task has completed.
zinit load "MichaelAquilina/zsh-auto-notify"

# Simple zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.
zinit load "MichaelAquilina/zsh-you-should-use"

# Zsh-z is a command line tool that allows you to jump quickly to directories that you have visited frequently
eval "$(zoxide init zsh)"

# Zsh Vi Mode
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh	

# act nourmal
bindkey "\e[3~" delete-char


#start tmux automatically
tmux attach &> /dev/null

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# exporting environment variables
export EDITOR="nvim"
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export NAVI_CONFIG="$HOME/.config/navi/config.yaml"
export GOBIN=$GOPATH/bin
export PATH=${PATH}:$GOBIN

#Custom cd when you cd into dir it will ls as well.
chpwd() exa --icons --group-directories-first --color-scale

# Alias
  alias history='fc -il 1' # for HIST_STAMPS in oh-my-zsh
  alias gdw="git diff --color-words"
  alias rg='rg -S'
  alias l="exa -lha"
  alias lt="exa -lhT"
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias v='nvim'
  alias home='cd ~'
  alias htp=wkhtmltopdf
  alias ytvid='yt-dlp -ciw --format mp4 -o "%(title)s.%(ext)s"'
  alias ytlist='yt-dlp -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias blist='yt-dlp --add-header 'Accept:*/*' -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias dict='dict -d gcide'
  alias ls="exa --icons --color-scale --long --header --git --sort=extension"
  alias tree="exa --tree --icons --color-scale --level=2"
  alias torrent='aria2c -d ~/Downloads'
  alias downsite='wget -r -p -U Mozilla --wait=10 --limit-rate=35K'
  alias upgrade='sudo pacman -Syu'
  alias zshreload="source ~/.zshrc"
  alias vi='nvim'
  alias vim='nvim'
  alias :q="exit"
  alias calc="insect"
  alias c='clear'
  alias nvimconfig='nvim ~/.config/nvim/init.vim'
  alias zshconfig='nvim ~/.zshrc'
  alias i3config='nvim ~/.config/i3/config'
  alias hosts='sudo nvim /etc/hosts'
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval "$(mcfly init zsh)"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
