#!/bin/bash
wallpaperdir="/home/jaredschein/Desktop/desktopBackgrounds"
files=($wallpaperdir/*)
currPath="/home/jaredschein/.config/background"

for _ in {1..10}; do
 randomPic="${files[RANDOM % ${#files[@]}]}"
 if ! cmp --silent "$randomPic" "$currPath"; then
 break
 fi
done

cp "$randomPic" "$currPath"


gsettings set org.gnome.desktop.background picture-uri-dark "file://$currPath"


