# Should be called before compinit
zmodload -i zsh/complist  # Load the zsh/complist module for advanced completion features.

# Enable Homebrew autocompletion
if command -v brew &>/dev/null; then  # Check if Homebrew is installed.
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"  # Add Homebrew's completion scripts to the FPATH variable.
fi

# Enable the Zsh Completion System
autoload -Uz compinit  # Load the compinit function.
compinit  # Initialize the Zsh completion system.
_comp_options+=(globdots)  # Include hidden files in completions.

# Enable shell autocompletion for kubectl
if command -v kubectl &>/dev/null; then  # Check if kubectl is installed.
  source <(kubectl completion zsh)  # Enable shell autocompletion for kubectl.
fi

# Autocompletion for Doppler
if command -v doppler &>/dev/null; then  # Check if Doppler is installed.
  source <(doppler completion 2> /dev/null)  # Enable autocompletion for Doppler.
fi

zle -C alias-expansion complete-word _generic  # Define a ZLE widget for alias expansion.
zstyle ':completion:alias-expansion:*' completer _expand_alias  # Define the completer for alias expansion.

zstyle :compinstall filename "$HOME/.zsh/completion.zsh"  # Set the filename for compinstall.

# Rehash completion.
zstyle ':completion:*' rehash true

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # remember to use single quote here!!!

# Define matcher lists for completion.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable git bash completion for `g`
if command -v __git_complete &> /dev/null; then  # Check if __git_complete is available.
  __git_complete g __git_main  # Enable git bash completion for `g`.
fi

# This causes pasted URLs to be automatically quoted, without needing to disable globbing.
# https://superuser.com/questions/649635/zsh-says-no-matches-found-when-trying-to-download-video-with-youtube-dl
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
