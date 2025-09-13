# ############################ customize prompt #########################
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.ohmyposh.json)"
fi

################################# Export ##########################################
export EDITOR="nvim"
export VISUAL='nvim'
export GREP_COLORS="ms=01;31:mc=01;36:sl=:cx=:fn=01;35:ln=01;32:bn=01;32:se=01;33"
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export PATH=~/.local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export MANPAGER='nvim +Man!'

################################### Options #######################################
bindkey "\e[3~" delete-char                   # make the delete key act nourmal

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
if [[ "$(uname -s)" == "Linux" ]] && [[ -f /etc/arch-release ]]; then
    eval `keychain --eval id_ed25519`
fi

#############  sheldon plugin manager for zsh
eval "$(sheldon source)"

################################## History #######################################
# Atuin replaces your existing shell history with a SQLite database
eval "$(atuin init zsh)"

# add this to gpg for macos
export GPG_TTY=$(tty)
