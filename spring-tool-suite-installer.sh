#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup Spring Tool Suite
# --------------------------------------------------
echo "Installing spring-tool-suite..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp /usr/bin/spring-tool-suite/bin/spring-tool-suite.png /usr/share/pixmaps/spring-tool-suite.png

# Setup of the .desktop file
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Spring Tool Suite
Comment=IDE for JavaEE/Spring development
Categories=Development;
Exec=/usr/bin/argoUML/bin/spring-tool-suite.sh
Icon=/usr/share/pixmaps/argoUML.png
Terminal=false" >> /usr/share/applications/spring-tool-suite.desktop
xdg-desktop-menu install /usr/share/applications/spring-tool-suite.desktop

echo "spring-tool-suite has been installed"
