#  ╭──────────────────────────────────────────────────────────╮
#  │                   This is my Zsh config                  │
#  │                   Email: me@fadyio.com                   │
#  │                   Github: @Fadyio                        │
#  ╰──────────────────────────────────────────────────────────╯
# ############################ customize prompt #########################
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.ohmyposh.json)"
fi

################################# Export ##########################################
export PATH=~/.cargo/bin:$PATH
export EDITOR="nvim"
export VISUAL='nvim'
export GREP_COLORS="ms=01;31:mc=01;36:sl=:cx=:fn=01;35:ln=01;32:bn=01;32:se=01;33"
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export PATH=~/.local/bin:$PATH
export MANPAGER='nvim +Man!'
export ZPWR_EXPAND_BLACKLIST=(ls zi z mv)

################################### Options #######################################
bindkey "\e[3~" delete-char                   # make the delete key act nourmal
setopt auto_cd                                # cd by typing directory name if it's not a command
unsetopt BEEP                                 # This disables the terminal beep
unsetopt correct_all                          # stop autocorrect commands
setopt MENU_COMPLETE                          # Automatically highlight first element of completion menu
setopt AUTO_LIST                              # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD                       # Complete from both ends of a word
########################## source alias and Plugins ##############################
source ~/.dotfiles/.zsh/completion.zsh
source ~/.dotfiles/.zsh/alias.zsh
source ~/.dotfiles/.zsh/function.zsh
#################### start tmux automatically ####################################
# Automatically start tmux if not already inside a tmux session
if [ -z "$TMUX" ]; then
    tmux has-session -t default 2>/dev/null
    if [ $? != 0 ]; then
        tmux new-session -s default
    else
        tmux attach-session -t default
    fi
    exit  # Ensure the current shell exits after starting tmux
fi

############# A smarter cd command is z for zsh
eval "$(zoxide init zsh)"

# Enable keychain in zsh only on Linux
eval `keychain --eval --agents ssh id_ed25519`

#############  sheldon plugin manager for zsh
eval "$(sheldon source)"

################################## History #######################################
# Atuin replaces your existing shell history with a SQLite database
eval "$(atuin init zsh)"
bindkey '^r' atuin-search

# add Pulumi to the PATH
export PATH=$PATH:/home/f0dy/.pulumi/bin
