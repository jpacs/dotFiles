if [[ "$1"  ]]; then
    case "$1" in
        -down )
            cp ~/.bashrc .bashrc
            cp ~/.config/bspwm/bspwmrc bspwmrc
            cp ~/.config/sxhkd/sxhkdrc sxhkdrc
            cp ~/.config/kitty/kitty.conf kitty.conf
            cp ~/.config/nvim/init.vim init.vim
            cp ~/.config/picom/picom.conf picom.conf
        ;;
        -up )
            cp .bashrc ~/.bashrc 
            cp bspwmrc ~/.config/bspwm/bspwmrc
            cp sxhkdrc ~/.config/sxhkd/sxhkdrc
            cp kitty.conf ~/.config/kitty/kitty.conf
            cp init.vim ~/.config/nvim/init.vim
            cp picom.conf ~/.config/picom/picom.conf

        ;;
    esac
fi
