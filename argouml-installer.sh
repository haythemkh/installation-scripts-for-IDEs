#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup AgroUML 2
# --------------------------------------------------
echo "Installing agroUML..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp /usr/bin/agroUML/bin/agroUML.png /usr/share/pixmaps/agroUML.png

# Setup of the .desktop file
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=ArgoUML
Comment=UML tool
Categories=Development;
Exec=/usr/bin/argoUML/bin/agroUML.sh
Icon=/usr/share/pixmaps/argoUML.png
Terminal=false" >> /usr/share/applications/agroUML.desktop
xdg-desktop-menu install /usr/share/applications/agroUML.desktop

echo "AgroUML has been installed"
