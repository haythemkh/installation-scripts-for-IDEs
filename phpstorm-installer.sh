#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup PhpStorm
# --------------------------------------------------
echo "Installing PhpStorm..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp /usr/bin/phpstorm/bin/phpstorm.png /usr/share/pixmaps/phpstorm.png

# Setup of the .desktop file
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Comment=IDE for web development
Categories=Development;
Exec=/usr/bin/phpstorm/bin/phpstorm.sh
Icon=/usr/share/pixmaps/phpstorm.png
Terminal=false" >> /usr/share/applications/phpstorm.desktop
xdg-desktop-menu install /usr/share/applications/phpstorm.desktop

echo "PhpStorm has been installed"
