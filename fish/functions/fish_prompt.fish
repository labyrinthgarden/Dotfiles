function fish_prompt
    echo
    set_color grey
    string repeat -n (tput cols) '─'

    echo -n '@'
    set_color red
    echo -n (whoami)
    set_color normal
    
    echo -n ' '
    echo -n ' ( '
    echo -n (prompt_pwd)
    echo -n ' ) '
    
    echo
    set_color grey
    echo -n ' └────── '
    echo -n (date +%H:%M:%S)
    echo -n ' ─── [ 🍔, 🍩 ] ──── 𝛟 ❯ '
    set_color normal
end

