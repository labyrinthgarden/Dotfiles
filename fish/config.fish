source /usr/share/cachyos-fish-config/cachyos-config.fish
alias c.="cd .."
alias SSID="nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2"
alias z="clear && fish"
alias ki="kill -9 -1"
alias na="nano -0 -l"
alias l="ls -la"
alias up="sudo pacman -Syu && yay -Syu"
alias s="clear && su"
alias shut='shutdown now'
alias rmh='rm /home/Aphroth/fish/fish_history'
alias edi='kwrite'
wal -R -n
clear
fastfetch
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
