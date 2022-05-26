#    		  This is my Zsh config 
#    		  Email:fadinagh0@gmail.com
#		      Github:@fady0    
#
#################### Added by Zinit's installer
source "$HOME/.dotfiles/.zsh/plugins/zinit/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

ZINIT[PLUGINS_DIR]=~/.dotfiles/.zsh/plugins
ZINIT[COMPLETIONS_DIR]=~/.dotfiles/.zsh/plugins
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
source ~/.dotfiles/.zsh/zsh-alias

#################### start tmux automatically ##########################
tmux attach &> /dev/null
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

