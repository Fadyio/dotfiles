# Load the zsh/complist module for advanced completion features
zmodload -i zsh/complist

# Enable Homebrew autocompletion
if command -v brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Enable the Zsh Completion System
autoload -Uz compinit
compinit

# Include hidden files in completions
setopt globdots

# Enable shell autocompletion for kubectl
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# Set up alias expansion
zle -C alias-expansion complete-word _generic
zstyle ':completion:alias-expansion:*' completer _expand_alias

# Rehash completion
zstyle ':completion:*' rehash true

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --pager=always ${(Q)realpath}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color-scale-mode gradient --long --header --git --sort=extension $realpath'

# Define matcher lists for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable git bash completion for `g`
if command -v __git_complete &> /dev/null; then
  __git_complete g __git_main
fi

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