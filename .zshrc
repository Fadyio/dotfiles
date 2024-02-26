#  ╭──────────────────────────────────────────────────────────╮
#  │                   This is my Zsh config                  │
#  │                   Email: me@fadyio.com                   │
#  │                   Github: @Fadyio                        │
#  ╰──────────────────────────────────────────────────────────╯
############################ customize prompt #########################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
################################# Export ##########################################
export PATH=~/.cargo/bin:$PATH
export EDITOR="nvim"
export VISUAL='nvim'
export GREP_COLORS="ms=04;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export PATH=~/.local/bin:$PATH
export MANPAGER='nvim -c "%! col -b" -c - +Man! '
export PATH="$PATH:$NPM_PACKAGES/bin"
export ZPWR_EXPAND_BLACKLIST=(ls zi z)

################################### Options #######################################
bindkey "\e[3~" delete-char                   # make the delete key act nourmal
bindkey '^e' edit-command-line                # Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line    # Edit line in vim with ctrl-e:
setopt auto_cd                                # cd by typing directory name if it's not a command
setopt always_to_end                          # move cursor to end if word had one match
unsetopt BEEP
setopt noglob
unsetopt correct_all                          # stop autocorrect commands
setopt correct
export KEYTIMEOUT=1
#::NOTE see that
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
########################## source alias and Plugins ##############################
source ~/.dotfiles/.zsh/completion.zsh
source ~/.dotfiles/.zsh/alias.zsh
source ~/.dotfiles/.zsh/scripts.zsh
source ~/.dotfiles/.zsh/fzf.zsh
#################### start tmux automatically ####################################
tmux attach &> /dev/null
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

# Enable keychain in zsh
eval `keychain --eval --agents ssh id_ed25519`

############# A smarter cd command is z for zsh
eval "$(zoxide init --cmd cd zsh)"

#############  sheldon plugin manager
eval "$(sheldon source)"

# Install npm packages globally without sudo on macOS and Linux
NPM_PACKAGES="${HOME}/.npm-packages"
################################## History #######################################
# Atuin replaces your existing shell history with a SQLite database
eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget
bindkey '^ ' autosuggest-accept
_zsh_autosuggest_strategy_atuin_top() {
    suggestion=$(atuin search --cmd-only --limit 1 --search-mode prefix $1)
}
ZSH_AUTOSUGGEST_STRATEGY=atuin_top
