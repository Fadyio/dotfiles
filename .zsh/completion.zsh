# Load the zsh/complist module for advanced completion features
zmodload -i zsh/complist
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Enable Homebrew autocompletion
if command -v brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Include hidden files in completions
setopt globdots

# Enable shell autocompletion for kubectl
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# Rehash completion
zstyle ':completion:*' rehash true

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --pager=always ${(Q)realpath}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color-scale-mode gradient --long --header --git --sort=extension ${(Q)realpath}'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Define matcher lists for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable URL quoting magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# New options as per suggestions
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt EXTENDED_GLOB
unsetopt BEEP                                 # This disables the terminal beep
unsetopt correct_all                          # stop autocorrect commands
setopt AUTO_LIST                              # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD                       # Complete from both ends of a word