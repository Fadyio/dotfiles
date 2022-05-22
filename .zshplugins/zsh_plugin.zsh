#### Plugin history-search-multi-word loaded with investigating.
#### zinit load zdharma-continuum/history-search-multi-word
#### Two regular plugins loaded without investigating.
#### zinit light zsh-users/zsh-autosuggestions
#### zinit light zdharma-continuum/fast-syntax-highlighting
#### Snippet
#### zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/



################# Plugins ####################
# Zsh Vi Mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# zsh syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions for zsh
zinit load "zsh-users/zsh-autosuggestions"

#diff-so-fancy strives to make your diffs human readable instead of machine readable
zinit load zdharma-continuum/zsh-diff-so-fancy

# A plugin that aims at providing what vim-startify plugin does
zinit load zdharma-continuum/zsh-startify

