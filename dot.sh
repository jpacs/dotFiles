#
#  To use simply run ./dot -down to download files or -up to restore them
#

if [[ "$1"  ]]; then
    case "$1" in
        -down )
            cp ~/.bashrc bashrc
            cp ~/.config/bspwm/bspwmrc bspwmrc
            cp ~/.config/sxhkd/sxhkdrc sxhkdrc
            cp ~/.config/kitty/kitty.conf kitty.conf
            cp ~/.config/nvim/init.vim init.vim
            cp ~/.config/picom/picom.conf picom.conf
            cp ~/.Xresources Xresources
            cp ~/.local/bin/bright.sh ~/Dev/dotFiles/scripts/
            cp ~/.local/bin/wallcycle.sh ~/Dev/dotFiles/scripts/
            cp ~/.local/bin/cpu-temp.sh ~/Dev/dotFiles/scripts/
            cp ~/.local/bin/gpu-fan.sh ~/Dev/dotFiles/scripts/
            cp ~/.local/bin/key-lay-switch.sh ~/Dev/dotFiles/scripts/
        ;;
        -up )
            cp bashrc ~/.bashrc 
            cp bspwmrc ~/.config/bspwm/bspwmrc
            cp sxhkdrc ~/.config/sxhkd/sxhkdrc
            cp kitty.conf ~/.config/kitty/kitty.conf
            cp init.vim ~/.config/nvim/init.vim
            cp picom.conf ~/.config/picom/picom.conf
            cp Xresources ~/.Xresources
            cp ~/Dev/dotFiles/scripts/ ~/.local/bin/bright.sh
            cp ~/Dev/dotFiles/scripts/ ~/.local/bin/wallcycle.sh
            cp ~/Dev/dotFiles/scripts/ ~/.local/bin/cpu-temp.sh
            cp ~/Dev/dotFiles/scripts/ ~/.local/bin/gpu-fan.sh
            cp ~/Dev/dotFiles/scripts/ ~/.local/bin/key-lay-switch.sh
        ;;
    esac
fi
