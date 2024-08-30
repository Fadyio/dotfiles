#Custom cd when you cd into dir it will ls as well.
chpwd() eza --icons --group-directories-first --color-scale all

# Alias

##  utilities
# Add aws Auto-completion
  alias awscmp='complete -C '/usr/local/bin/aws_completer' aws'
  alias copilot='gh copilot suggest'
  alias explain='gh copilot explain'
  alias c='clear'
  alias x='extract'
  alias memory='ps axch -o cmd:15,%mem --sort=-%mem | head'
  alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
  alias v='nvim'
  alias y='yy'
  alias grep='grep --color=auto'
 # Changing "ls" to "exa"
  alias j="zi"
  alias ls="eza --icons --color-scale-mode gradient --long --header --git --sort=extension"
  alias la='eza -a --color=always --group-directories-first'  # all files and dirs
  alias l="eza --oneline --all --long --no-user --icons=auto --no-permissions --time-style=long-iso"
  alias l.='eza -a | egrep -E "^\."'
  alias tree="eza --tree --icons --color-scale --level=2"
## download stuff
  alias ytvid='yt-dlp  -P ~/Downloads -ciw --format "bv*[height<=720]+ba*[ext=m4a]"  --embed-chapters --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction  -o "%(title)s.%(ext)s"'
  alias ytlist='yt-dlp -P ~/Downloads -ciw --format "bv*[height<=720]+ba*[ext=m4a]"  --embed-chapters --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction  -o  "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias ytmp3="yt-dlp --sponsorblock-remove  sponsor,intro,outro,selfpromo,interaction  --embed-chapters --extract-audio  --audio-format mp3 "
  alias ytflac="yt-dlp --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction   --embed-chapters  --extract-audio --audio-format flac "
# confirm before overwriting something
  alias cp="cp -riv"
  alias mv='mv -iv'
  alias rm='rm -i'
  alias mkdir='mkdir -vp'
## Git stuff
  alias g='git'
# Switch to common branch, pull and prune
  alias g-main="git checkout main && git pull && git fetch -p"
  alias g-dev="git checkout dev && git pull && git fetch -p"
  alias vs="code ."
# terraform Alias
  alias tf="terraform"
  alias tfp="terraform plan"
  alias tfa="terraform apply"
  alias tfd="terraform destroy"
  alias tfi="terraform init"
