#script for wallpaper cycling

WPDIR="${HOME}/Pictures/Wallpapers/"

if [ $1 ]; then
    exec ~/.config/polybar/scripts/pywal.sh $WPDIR$1
else
    exec ~/.config/polybar/scripts/pywal.sh $WPDIR
fi
