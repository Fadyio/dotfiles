#Custom cd when you cd into dir it will ls as well.
chpwd() eza --icons --group-directories-first --color-scale all

# Alias

##  utilities
# Add aws Auto-completion
  alias awsv='aws-vault exec fadyio -- aws '
  alias awscmp='complete -C '/usr/local/bin/aws_completer' aws'
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
  alias l="eza -l --icons --git -a"
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
  alias glog="git log --graph --format='format:%C(yellow)%h%C(reset) %s %C(magenta)%cr%C(reset)%C(auto)%d%C(reset)'"
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
  # Networking
  alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"
  alias nmap_open_ports="nmap --open"
  alias nmap_list_interfaces="nmap --iflist"
  alias nmap_slow="sudo nmap -sS -v -T1"
  alias nmap_fin="sudo nmap -sF -v"
  alias nmap_full="sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
  alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4"
  alias nmap_ping_through_firewall="nmap -PS -PA"
  alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
  alias nmap_detect_versions="sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
  alias nmap_check_for_vulns="nmap --script=vuln"
  alias nmap_full_udp="sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
  alias nmap_traceroute="sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
  alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all "
  alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "
  alias nmap_ping_scan="nmap -n -sP"
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
