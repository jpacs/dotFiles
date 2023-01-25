#
# ~/.bashrc
#

. /usr/share/doc/ranger/examples/shell_automatic_cd.sh
# autoload at start pywall terminal colors
(cat ~/.cache/wal/sequences &)
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
columns=$(tput cols)
mod=`awk -v v1=$columns 'BEGIN { a = v1; print ( (a%15) ) }'`
columns=`awk -v v1=$columns -v v2=$mod 'BEGIN { a = v1; b = v2; print ( a - b ) }'`
np=`awk -v v1=$columns 'BEGIN { a = v1; print ( (a/15) ) }'`
ms="   /===="
for ((i = 0; i < $np; i++)); do
    ms=$ms"//=//=//===="
done
ms=$ms"/"
printf '\e[33m\n    %s\n\n\t\e[0m' $ms
motivate
printf '\e[33m\n    %s\n\n\t\e[0m' $ms
###################
#  prompt
###################
#git
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function pcp {
  case $1 in
    -b )    echo "\[\033[48;5;"$2"m\]"$3"\[$(tput sgr0)\]" ;;
    -f )    echo "\[\033[38;5;"$2"m\]"$3"\[$(tput sgr0)\]" ;;
    -m )    echo "\[\033[38;5;"$2"m\]\[\033[48;5;"$3"m\]"$4"\[$(tput sgr0)\]"
  esac
}
export PS0="\[\033[38;5;3m\]   /====//=//=//====//=//=//====//=//=//====//=//=//====//=//=//====//=//=//====//=//=//====//=//=//=>> \[$(tput sgr0)\]\n\n"
prompt='\n'\
$(pcp -f 1 ' ')\
$(pcp -b 1 '   \u ')\
$(pcp -m 1 5 ' ')\
$(pcp -m 7 5 '  \t ')\
$(pcp -m 5 3 ' ')\
$(pcp -b 3 '  \w ')\
$(pcp -f 3 ' ')\
'\n \[\033[38;5;3m\]   /====//==>> \[$(tput sgr0)\] '
export PS1=$prompt
export PS2='->  '
###PROMPT_COMMAND='echo -en "\033]0;New terminal title\a"'
#    
vava='test'
function tc {
  for (( i = 0; i < 8; i++ )); do
    echo -e $(pcp -i $i ' l ')
  done
}
alias box="WM=openbox startx"
alias sx="startx"
alias sn="shutdown now"
alias rb="reboot"
###################
alias ytdl="cd /mnt/tera/Media/Downloads/ && youtube-dl -x --audio-format mp3"
###################
#  pacman/yay
###################
alias spac='sudo pacman'
alias pac='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias yays='yay -S'
alias yayr='yay -Rns'
###################
alias ssa='asciiquarium'
alias ssm='cmatrix'
alias ssp='pipes.sh'
alias ssr='rain'
###################
## ls config
###################
alias ls='ls -x --color=always'
alias la='ls -xA'
alias ll='ls -lh'
alias lla='ls -lhA'
alias lls='ls -lhAS'
alias lt='ls -lhArt'
##################
## folder/file/bash_history/cd navigation
###################
fcd() {
  cd "$(find -type d | fzf)"
}
open() {
  xdg-open "$(find -type f | fzf)"
}
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
alias h="cat ~/.bash_history | fzf | tr -d '\n' | xclip -selection c"
alias cdr='cd /'
alias cd.='cd ..'
##################
## shortcuts and config shortcuts
###################
alias cl='clear'
alias rst='cl ; exec bash'
alias brc='v ~/.bashrc'
alias rm='rm -i'
#####
alias dots="cd Dev/dotFiles && v dot.sh"
#####
alias bsprc='v ~/.config/bspwm/bspwmrc'
alias sxhrc='v ~/.config/sxhkd/sxhkdrc'
alias bspwmrc='v ~/.config/bspwm/bspwmrc'
alias sxhkdrc='v ~/.config/sxhkd/sxhkdrc'
#####
alias r='ranger'
alias rrc='v ~/.config/ranger/rc.conf'
alias rcd='ranger_cd'
alias rww='ranger Pictures/Wallpapers/'
#####
alias nn='nano'
alias snn='sudo nano'
alias v='nvim'
alias vrc='v ~/.config/nvim/init.vim'
alias cleanvim='rm -r ~/.local/share/nvim/swap/*'
#####
alias poly='~/.config/polybar/launch.sh'
alias cpoly='v ~/.config/polybar/config.ini'
alias kc="kitty @ set-colors --all --configured -c ~/.config/kitty/kitty.conf"
alias ck='v ~/.config/kitty/kitty.conf'
alias wall='r ~/Pictures/Wallpapers'
alias wallrc='v ~/.config/polybar/scripts/pywal.sh'
alias cwall='~/.config/polybar/scripts/pywal.sh'
alias nf='neofetch'
#####
alias avr8='sudo pacman -U file:///var/cache/pacman/pkg/avr-gcc-8.3.0-1-x86_64.pkg.tar.xz'
alias avr12='sudo pacman -U file:///var/cache/pacman/pkg/avr-gcc-12.1.0-1-x86_64.pkg.tar.zst'
###################
## qmk_firmware
##################
alias crkbd='cd ~/Dev/qmk_firmware/ && v keyboards/crkbd/keymaps/xsloth'
alias cdcrk='cd ~/Dev/qmk_firmware/'
alias kyria='cd ~/Dev/qmk_firmware/ && v keyboards/splitkb/kyria/keymaps/xsloth'
alias cdkyr='cd ~/Dev/qmk_firmware/'
alias ccrk='make crkbd/rev1:xsloth:dfu'
alias cqmkn='make crkbd/rev1:xsloth_miryoku:dfu'
alias ckyr='qmk compile -e CONVERT_TO=promicro_rp2040 -kb splitkb/kyria -km xsloth'
alias cdqmk='cd ~/Dev/qmk_firmware'
##################
## git shortcuts
###################
alias gaa='git add --all'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gs='git status'
alias gp='gt && git push'
alias gt='head ~/Documents/gittoken | xclip -selection c'
#################
## systemctl
###################
alias se='sudo systemctl enable'
alias sd='sudo systemctl disable'
alias ssta='sudo systemctl start'
alias ssto='sudo systemctl stop'
alias sr='sudo systemctl restart'
###################
## web
###################
alias webcd='cd /srv/http/; cd'
alias weben='sudo systemctl enable httpd.service && sudo systemctl enable mariadb.service'
alias webdis='sudo systemctl disable httpd.service && sudo systemctl disable mariadb.service'
alias webon='sudo systemctl start httpd.service && sudo systemctl start mariadb.service'
alias weboff='sudo systemctl stop httpd.service && sudo systemctl stop mariadb.service'
alias webres='sudo systemctl restart httpd.service mariadb.service'
###################
## dev
###################
alias npmi='sudo npm install'
alias npmig='sudo npm install -g'
alias nrb='npm run build'
alias nxstart='systemctl enable nginx.service && systemctl start nginx.service'
alias nxstop='systemctl stop nginx.service && systemctl disable nginx.service'
alias nxc='v /etc/nginx/nginx.conf'
###################
## stream
###################
alias cam='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0'
alias camdet='gphoto2 --auto-detect'
alias camsum='gphoto2 --summary'
###################
#keyboard layout
###################
alias laypt='setxkbmap -model pc105 -layout pt'
alias layus='setxkbmap -model pc105 -layout us'
alias layint='setxkbmap -model pc105 -layout us -variant intl'
###################
#directories
###################
alias tera='cd /mnt/tera'
alias nvme='cd /mnt/nvme'
alias space='cd /mnt/space'
###################
# music mpd
###################
alias mon='systemctl --user start mpd.service'
alias moff='systemctl --user stop mpd.service'
export PATH="${PATH}:/home/jpacs/.local/bin"
###################
# extract compressed files --> https://www.linuxfordevices.com/tutorials/linux/extract-compressed-files-custom-command
###################
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)    tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xf $1      ;;
        *.bz2)        bunzip2 $1     ;;
        *.rar)        unrar x $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)        tar xvf $1     ;;
        *.tbz2)        tar xvjf $1    ;;
        *.tgz)        tar xvzf $1    ;;
        *.zip)        unzip $1       ;;
        *.Z)        uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)        echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
