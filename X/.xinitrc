usermodmap=~/.Xmodmap
userresources=~/.Xdefault

if [ -f "$usermodmap" ]; then
 xmodmap $usermodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge $userresources
fx

chromium &

keynav &

exec xmonad
