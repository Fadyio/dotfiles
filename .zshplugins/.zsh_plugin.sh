################# Plugins ####################

# zsh theme
zinit load "romkatv/powerlevel10k"

# History Search Multi Word 
z-shell/H-S-MW

# enable auto-notify
MichaelAquilina/zsh-auto-notify

# zsh syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions for zsh
zinit load "zsh-users/zsh-autosuggestions"

# Simple zsh plugin that automatically sends out a notification when a long running task has completed.
zinit load "MichaelAquilina/zsh-auto-notify"

# Simple zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.
zinit load "MichaelAquilina/zsh-you-should-use"

# Zsh Vi Mode
ohmyzsh/ohmyzsh path:plugins/vi-mode/vi-mode.plugin.zsh