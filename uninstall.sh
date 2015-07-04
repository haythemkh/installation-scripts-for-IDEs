#!/bin/sh
installPath="/usr/bin/$1";
linkPath="/usr/local/bin/$1";
desktopFilePath="/usr/share/applications/$1.desktop";
iconPath="/usr/share/pixmaps/$1.png";

if [ "$(id -u)" != "0" ] ; then
   echo "This script must be run as root"
   exit 1
fi

if [ -d $installPath ] ; then
    echo "Removing $1 install folder..."
    rm -r $installPath
fi

if [ -h $linkPath ] ; then
    echo "Removing link in /usr/bin..."
    rm $linkPath
fi

if [ -e $desktopFilePath ] ; then
    echo "Removing .desktop file..."
    rm -r $desktopFilePath
fi

if [ -e $iconPath ] ; then
    echo "Removing icon..."
    rm $iconPath
fi
