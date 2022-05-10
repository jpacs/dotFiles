if [[ $1  ]]; then
    echo "in here"
    case $1 in
        -down )
        echo "files being sourced"
            cp ~/.bashrc .bashrc
            cp ~/.config/bspwm/bspwmrc bspwmrc
            cp ~/.config/sxhkd/sxhkdrc sxhkdrc
            cp ~/.config/kitty/kitty.conf kitty.conf
            cp ~/.config/nvim/init.vim init.vim
        echo "all done!"
        ;;
        -up )
        ;;
    esac
fi
