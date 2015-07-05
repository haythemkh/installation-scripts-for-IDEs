#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup Webstorm
# --------------------------------------------------
echo "Installing webstorm..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp /usr/bin/webstorm/bin/webstorm.png /usr/share/pixmaps/webstorm.png

# Setup of the .desktop file
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=WebStorm
Comment=IDE for web development
Categories=Development;
Exec=/usr/bin/webstorm/bin/webstorm.sh
Icon=/usr/share/pixmaps/webstorm.png
Terminal=false" >> /usr/share/applications/webstorm.desktop
xdg-desktop-menu install /usr/share/applications/webstorm.desktop

echo "AgroUML has been installed"
