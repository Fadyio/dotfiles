#    		  This is my Zsh config
#    		  Email:me@fadyio.com
#		      Github:@Fadyio
#
############################ customize prompt #########################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#################### Added by Zinit's installer ##################################
source "$HOME/.dotfiles/.zsh/plugins/zinit/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
ZINIT[PLUGINS_DIR]=~/.dotfiles/.zsh/plugins
#ZINIT[COMPLETIONS_DIR]=~/.dotfiles/.zsh/plugins
ZINIT[SNIPPETS_DIR]=~/.dotfiles/.zsh/plugins
######################### End of Zinit's installer chunk ##########################
################################# Export ##########################################
export PATH=~/.cargo/bin:$PATH
export EDITOR="nvim"
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export PATH=~/.local/bin:$PATH
export MANPAGER='nvim -c "%! col -b" -c - +Man! '
export PATH="$PATH:$NPM_PACKAGES/bin"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:red,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--color='$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
################################### Options #######################################
setopt auto_cd 						                    # cd by typing directory name if it's not a command
setopt always_to_end 					                # move cursor to end if word had one match
unsetopt BEEP
setopt noglob
unsetopt correct_all 					                # stop autocorrect commands
export KEYTIMEOUT=1
bindkey "\e[3~" delete-char 				            # make the delete key act nourmal
bindkey '^e' edit-command-line				            # Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line    # Edit line in vim with ctrl-e:
#::NOTE see that
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

################################## History #######################################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups 				            # remove older duplicate entries from history
setopt hist_reduce_blanks 				                # remove superfluous blanks from history items
setopt inc_append_history 				                # save history entries as soon as they are entered
# don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }
########################## source alias and Plugins ##############################
source ~/.dotfiles/.zsh/completion.zsh
source ~/.dotfiles/.zsh/plugins.zsh
source ~/.dotfiles/.zsh/alias.zsh
source ~/.dotfiles/.zsh/scripts.zsh
source ~/.dotfiles/.zsh/fzf-completion.zsh
source ~/.dotfiles/.zsh/fzf-bindings.zsh
#################### start tmux automatically ####################################
tmux attach &> /dev/null
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
##################### zsh-history-substring-search ###############################
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Cycle through history based on what I have already typed
# https://superuser.com/a/585004
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Enable keychain in zsh
eval `keychain --eval --agents ssh id_ed25519`

# Install npm packages globally without sudo on macOS and Linux
NPM_PACKAGES="${HOME}/.npm-packages"

# Hishtory Config:
export PATH="$PATH:/home/f0dy/.hishtory"
source /home/f0dy/.hishtory/config.zsh
