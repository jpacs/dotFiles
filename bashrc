#
# ~/.bashrc
#

# autoload at start pywall terminal colors
(cat ~/.cache/wal/sequences &)
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
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
'\n \[\033[38;5;3m\]   /==>> \[$(tput sgr0)\] '
export PS1=$prompt

###PROMPT_COMMAND='echo -en "\033]0;New terminal title\a"'
#    
vava='test'
function tc {
  for (( i = 0; i < 8; i++ )); do
    echo -e $(pcp -i $i ' l ')
  done
}
###################
#  pacman/yay
###################
alias spac='sudo pacman'
alias pac='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias yays='yay -S'
###################
###################
## ls config
###################
alias ls='ls -x --color=always'
alias la='ls -xA'
alias ll='ls -lhA'
alias lls='ls -lhAS'
alias lt='ls -lhArt'
###################
## bash/terminal clean and configs
###################
alias cl='clear'
alias rst='cl ; exec bash'
alias brc='vim ~/.bashrc'
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
alias hist="cat ~/.bash_history | fzf | tr -d '\n' | xclip -selection c"
alias cdr='cd /'
alias cd.='cd ..'
##################
## shortcuts and config shortcuts
###################
alias r='ranger'
alias nn='nano'
alias snn='sudo nano'
alias vim='nvim'
alias vimrc='vim ~/.config/nvim/init.vim'
alias cleanvim='rm -r ~/.local/share/nvim/swap/*'
alias poly='~/.config/polybar/launch.sh'
alias cpoly='vim ~/.config/polybar/launch.sh'
alias ckitty='vim ~/.config/kitty/kitty.conf'
alias kc="kitty @ set-colors --all --configured -c ~/.config/kitty/kitty.conf"
alias cwall='vim ~/.config/polybar/scripts/pywal.sh'
alias nf='neofetch'
##################
## git shortcuts
###################
alias gits='git status'
alias gitp='gt && git push'
alias gt='head ~/gittoken | xclip -selection c'
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
alias webon='sudo systemctl start httpd mysqld'
alias weboff='sudo systemctl stop httpd mysqld'
alias webres='sudo systemctl restart httpd mysqld'
###################
## dev
###################
alias npmi='sudo npm install'
alias npmig='sudo npm install -g'
alias nrb='npm run build'
###################
#keyboard layout
###################
alias laypt='setxkbmap -model pc105 -layout pt'
alias layus='setxkbmap -model pc105 -layout us'
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
