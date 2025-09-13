##  utilities
  alias awscmp='complete -C '/usr/local/bin/aws_completer' aws'
  alias copilot='gh copilot suggest'
  alias explain='gh copilot explain'
  alias c='clear'
  alias memory='ps axch -o cmd:15,%mem --sort=-%mem | head'
  alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
  alias v='nvim'
  alias hx='helix'
  alias y='yy'
  alias grep='grep --color=auto'
  alias j="zi"
  alias ls="eza --icons --color-scale-mode gradient --long --header --git --sort=extension"
  alias la='eza -a --color=always --group-directories-first --icons=auto'  # all files and dirs
## download stuff
  alias ytvid='yt-dlp  -P ~/Downloads -ciw --format "bv*[height<=720]+ba*[ext=m4a]"  --embed-chapters --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction  -o "%(title)s.%(ext)s"'
  alias ytlist='yt-dlp -P ~/Downloads -ciw --format "bv*[height<=720]+ba*[ext=m4a]"  --embed-chapters --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction  -o  "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
  alias ytmp3="yt-dlp --sponsorblock-remove  sponsor,intro,outro,selfpromo,interaction  --embed-chapters --extract-audio  --audio-format mp3 "
# confirm before overwriting something
  alias cp="cp -riv"
  alias mv='mv -iv'
  alias rm='rm -i'
  alias mkdir='mkdir -vp'
## Git stuff
  alias g='git'
  alias gleaks="gitleaks detect --source . -v"
# Switch to common branch, pull and prune
  alias g-main="git checkout main && git pull && git fetch -p"
  alias vs="code ."
  alias grype='grype dir:. -o table'
# terraform Alias
  alias tf="terraform"
  alias tfp="terraform plan"
  alias tfa="terraform apply"
  alias tfd="terraform destroy"
  alias tfi="terraform init"
#Custom cd when you cd into dir it will ls as well.
chpwd() eza --icons --group-directories-first --color-scale all
