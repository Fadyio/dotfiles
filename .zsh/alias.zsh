#Custom cd when you cd into dir it will ls as well.
chpwd() exa --icons --group-directories-first --color-scale

# Alias

##  utilities
  alias mdkir='mkdir'
  alias sudp='sudo'
  alias :q="exit"
  alias q='exit'
  alias c='clear'
  alias upgrade='sudo pacman -Syu'
  alias zshreload="source ~/.zshrc"
  alias nvimconfig='nvim ~/.config/nvim/init.vim'
  alias zshconfig='nvim ~/.zshrc'
  alias i3config='nvim ~/.config/i3/config'
  alias hosts='sudo nvim /etc/hosts'
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias x='extract'
  alias memory='ps axch -o cmd:15,%mem --sort=-%mem | head'
  alias cputemp='sensors | awk '/^Core*/ {print $1$2, $3}''
  alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
  alias d='dirs -v'
  for index ({1..10}) alias "$index"="cd +${index}"; unset index
## alias for programs that i use  
  alias v='nvim'
  alias r='ranger'
  alias htp=wkhtmltopdf
  alias dict='dict -d gcide'
  alias calc="insect"
  alias history='fc -il 1' # for HIST_STAMPS in oh-my-zsh
  alias rg='rg -S'
 # Changing "ls" to "exa"
  alias ls="exa --icons --color-scale --long --header --git --sort=extension"
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias l.='exa -a | egrep "^\."'
  alias tree="exa --tree --icons --color-scale --level=2"
## download stuff
  alias ytvid='yt-dlp -P ~/Downloads -ciw --format mp4 -o "%(title)s.%(ext)s"'
  alias ytlist='yt-dlp -P ~/Downloads -ciw --format mp4  -o  "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias blist='yt-dlp --add-header 'Accept:*/*' -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias ytmp3="youtube-dl --extract-audio --audio-format mp3 "
  alias ytflac="youtube-dl --extract-audio --audio-format flac "
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
  alias ga='git add'
  alias gaa='git add .'
  alias gp='git pull'
  alias gd="git diff --color-words"
  alias gl='git log'
  alias gs='git status'
  alias gc='git commit -m'
  alias gnb='git checkout -b'
  alias gpu='git push origin master'
  alias gfix='git rm -r --cached . && git add .'
  alias gb='git branch'
  alias gbl='git branch --verbose --verbose'
  alias gcam='git add . && git commit --message'
  alias gco='git checkout'
