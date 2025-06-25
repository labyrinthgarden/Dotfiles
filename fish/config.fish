set -U fish_greeting
export PATH="$HOME/.local/bin:$PATH"
alias c.="cd .."
alias SSID="nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2"
alias z="clear && fish"
alias ki="kill -9 -1"
alias na="nano -0 -l"
alias l="ls -la"
#alias dn="sudo dnf5"
#alias up="dn update -y && dn upgrade -y"
alias up="sudo pacman -Syu && yay -Syu"
alias s="clear && su"
alias shut='shutdown now'
alias rmh='rm ~/fish/fish_history'
alias edi='kwrite'
wal -R -n
clear
sleep 0.1
fastfetch
