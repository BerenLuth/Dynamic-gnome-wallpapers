#! /bin/bash

if [ $# -eq 0 ]
  then
    echo "Removing all the dynamic wallpapers ..."
    for dir in */; do
        dir=${dir::-1}
        sudo rm -rf /usr/share/backgrounds/gnome/$dir-timed
        sudo rm -rf /usr/share/backgrounds/gnome/$dir-timed.xml  
        sudo rm -rf /usr/share/gnome-background-properties/$dir.xml
        echo "Removed $dir dynamic wallpaper!"
    done
else
    echo "Removing $1 from installed wallpapers ..."
    sudo rm -rf /usr/share/backgrounds/gnome/$1-timed
    sudo rm -rf /usr/share/backgrounds/gnome/$1-timed.xml  
    sudo rm -rf /usr/share/gnome-background-properties/$1.xml
    echo "Removed $1 dynamic wallpaper!"
fi
