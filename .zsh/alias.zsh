#Custom cd when you cd into dir it will ls as well.
chpwd() eza --icons --group-directories-first --color-scale all

# Alias

##  utilities
# Add aws Auto-completion
  alias awscmp='complete -C '/usr/local/bin/aws_completer' aws'
  alias awsv='aws-vault exec fadyio -- aws '
  alias copilot='gh copilot suggest'
  alias explain='gh copilot explain'
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
