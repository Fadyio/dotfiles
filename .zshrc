#    		  This is my Zsh config 
#    		  Email:fadinagh0@gmail.com
#		      Github:@fady0    
#
#################### Added by Zinit's installer
source "$HOME/.dotfiles/.zsh/plugins/zinit/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

ZINIT[PLUGINS_DIR]=~/.dotfiles/.zsh/plugins
#ZINIT[COMPLETIONS_DIR]=~/.dotfiles/.zsh/plugins
ZINIT[SNIPPETS_DIR]=~/.dotfiles/.zsh/plugins

######################### End of Zinit's installer chunk
######################### export
export PATH=/opt/homebrew/bin:$PATH
export EDITOR="nvim"
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

############################ customize prompt #########################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################### Options #########################################################
setopt auto_cd 						                    # cd by typing directory name if it's not a command
setopt always_to_end 					                # move cursor to end if word had one match
setopt hist_ignore_all_dups 				            # remove older duplicate entries from history
setopt hist_reduce_blanks 				                # remove superfluous blanks from history items
setopt inc_append_history 				                # save history entries as soon as they are entered
unsetopt correct_all 					                # stop autocorrect commands
bindkey "\e[3~" delete-char 				            # make the delete key act nourmal 
bindkey '^e' edit-command-line				            # Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line    # Edit line in vim with ctrl-e:

# Save history so we get auto suggestions
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt noglob

########################## source alias and Plugins ####################
source ~/.dotfiles/.zsh/zsh_plugin
source ~/.dotfiles/.zsh/zsh_alias
source ~/.dotfiles/.zsh/zsh_function

#################### start tmux automatically ##########################
tmux attach &> /dev/null
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
########################## zsh-autocomplete ###########################
# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

##################### zsh-history-substring-search ################
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval `keychain --eval --agents ssh id_rsa`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
