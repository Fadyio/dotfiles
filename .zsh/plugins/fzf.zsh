# Setup fzf
# ---------
if [[ ! "$PATH" == */home/f0dy/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/f0dy/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/f0dy/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/f0dy/.fzf/shell/key-bindings.zsh"
