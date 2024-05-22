#! /bin/bash

if [ $# -eq 0 ]
  then
    echo "Adding all wallpapers ..."
else
    echo "Adding $1 to wallpapers ..."
fi

cd /tmp
if [ -d "Dynamic-gnome-wallpapers" ]; then
    echo "Repository already cloned, fetching updates..."
    cd Dynamic-gnome-wallpapers
    git pull
    echo ""
else
    echo "Starting to download ..."
    git clone https://github.com/BerenLuth/Dynamic-gnome-wallpapers.git
    cd Dynamic-gnome-wallpapers
fi
echo "Ready to install wallpapers"

SHOPT=$(shopt -p extglob)   # saves the previous state
shopt -s extglob    # enagle regex in bash

if [ $# -eq 0 ]; then
    for dir in */; do
        dir=${dir::-1}
        echo "- Installing $dir ..."
        cd $dir
        sudo mkdir -p /usr/share/backgrounds/gnome/$dir-timed
        sudo cp ?(*.jpeg|*.png|*.jpg) /usr/share/backgrounds/gnome/$dir-timed
        sudo cp $dir-timed.xml /usr/share/backgrounds/gnome
        sudo cp $dir.xml /usr/share/gnome-background-properties
        echo "   Added $dir dynamic wallpaper!"
        cd ..
    done
else
    echo "Installing $1 ..."
    cd $1
    sudo mkdir -p /usr/share/backgrounds/gnome/$1-timed
    sudo cp ?(*.jpeg|*.png|*.jpg) /usr/share/backgrounds/gnome/$1-timed
    sudo cp $1-timed.xml /usr/share/backgrounds/gnome
    sudo cp $1.xml /usr/share/gnome-background-properties
    echo "Added $1 dynamic wallpaper!"
    cd ..
fi

${SHOPT}    # restore the previous state of bash regex interpretation

# Uncomment the next lines to delete the folder after installation
# Not strictly necessary since it saves the folter in /tmp
#
# echo "Cleaning up ..."
# cd ..
# rm -rf Dynamic-gnome-wallpapers
