#Custom cd when you cd into dir it will ls as well.
chpwd() eza --icons --group-directories-first --color-scale all

# Alias

##  utilities
# Add aws Auto-completion
  alias awscmp='complete -C '/usr/local/bin/aws_completer' aws'
  alias awsv='aws-vault exec fadyio -- aws '
  alias copilot='gh copilot suggest'
  alias explain='gh copilot explain'
  alias k='kubectl'
  alias mdkir='mkdir'
  alias sudp='sudo'
  alias :q="exit"
  alias c='clear'
  alias zshreload="source ~/.zshrc"
  alias zshconfig='nvim ~/.zshrc'
  alias i3config='nvim ~/.config/i3/config'
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias x='extract'
  alias memory='ps axch -o cmd:15,%mem --sort=-%mem | head'
  alias cputemp='sensors | awk '/^Core*/ {print $1$2, $3}''
  alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
  alias tldr='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
  alias v='nvim'
  alias htp=wkhtmltopdf
  alias sblock='sudo bash ~/.dotfiles/scripts/smedia.sh'
  alias cat='bat --color=always'
  alias grep='grep --color=auto'
 # Changing "ls" to "exa"
  alias ls="eza --icons --color-scale all --long --header --git --sort=extension"
  alias la='eza -a --color=always --group-directories-first'  # all files and dirs
  alias ll='eza -l --color=always --group-directories-first'  # long format
  alias l.='eza -a | egrep "^\."'
  alias tree="eza --tree --icons --color-scale --level=2"
## download stuff
  alias ytvid='yt-dlp  -P ~/Downloads -ciw --format mp4 --sponsorblock-remove sponsor -o "%(title)s.%(ext)s"'
  alias ytlist='yt-dlp -P ~/Downloads -ciw --format mp4  --sponsorblock-remove sponsor -o  "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias blist='yt-dlp --add-header 'Accept:*/*' -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias ytmp3="yt-dlp --sponsorblock-remove  sponsor --extract-audio  --audio-format mp3 "
  alias ytflac="yt-dlp --sponsorblock-remove sponsor --extract-audio --audio-format flac "
  alias torrent='aria2c -d ~/Downloads'
  alias downsite='wget -r -p -U Mozilla --wait=10 --limit-rate=35K'
# confirm before overwriting something
  alias cp="cp -riv"
  alias mv='mv -iv'
  alias rm='rm -i'
  alias mkdir='mkdir -vp'
## Git stuff
  alias g='git'
  alias lg='lazygit'
  alias ga='git add '
  alias gb='git branch '
  alias gc='git commit'
  alias gds='git diff --staged'
  alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
# Switch to common branch, pull and prune
  alias g-main="git checkout main && git pull && git fetch -p"
  alias g-dev="git checkout dev && git pull && git fetch -p"
# git+github: check out PR by number
  alias ghpr='gh pr checkout'
# git: create a PR
  alias pr-create='gh pr create -f'
  alias pr-create-draft='gh pr create -f -d'
  alias vs="code ."
  alias pubkey="cat ~/.ssh/id_rsa.pub"
  alias pubkeycopy="cat ~/.ssh/id_rsa.pub | pbcopy"
  # Get week number
  alias week='date +%V'
# Show IP
  alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# Kubernetes
  alias k="kubectl"
  alias kg="kubectl get"
  alias kd="kubectl describe"
  alias kgp="kg pods"
  alias kgpw="kg pods --watch"
  alias kgd="kg deploy"
  alias kgn="kg nodes"
  alias kdp="kd pod"
  alias kdd="kd deploy"
  alias ktop="k top pod"
  alias kexec="k exec -ti "
  alias klog="k logs"
  alias klogf="k logs -f"
  alias klogf5m="k logs --since 5m -f"
  alias klogf1m="k logs --since 1m -f"
  alias klogf1s="k logs --since 1s -f"
  alias klogprev="k logs --tail 40 --previous"
