set -U fish_greeting
export PATH="$HOME/.local/bin:$PATH"

set -gx PATH "$HOME/.local/bin" $PATH

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH $PATH $ANDROID_HOME/cmdline-tools/latest/bin
set -gx PATH $PATH $ANDROID_HOME/platform-tools
set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx JAVA_HOME "/usr/lib/jvm/java-21-temurin-jdk"

alias c.="cd .."
alias SSID="nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d\' -f2"
alias z="clear && fish"
alias ki="kill -9 -1"
alias na="nano -0 -l"
alias l="ls -la"
alias dn="sudo dnf5"
alias up="dn upgrade -y && dn autoremove && dn clean all"
alias siu="sudo pacman -Syu"
alias s="clear && su"
alias shut='shutdown now'
alias rmh='rm ~/fish/fish_history'
alias edi='kwrite'
if not string match -q '*zed-editor*' (ps -o comm= -p $fish_pid)
  wal -R -n
  clear
  sleep 0.1
  fastfetch
end
