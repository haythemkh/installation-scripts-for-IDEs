#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup Android studio
# --------------------------------------------------
echo "Downloading and extracting Android Studio bundle..."

echo "Installing android-studio..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp android-studio/bin/idea.png /usr/share/pixmaps/android-studio.png

# Setup of the .desktop file
sudo sh -c 'echo "[Desktop Entry]"'
sudo sh -c 'echo "Version=1.0"'
sudo sh -c 'echo "Encoding=UTF-8"'
sudo sh -c 'echo "Name=Android Studio"'
sudo sh -c 'echo "GenericName=Android Studio bundle"'
sudo sh -c 'echo "Comment=IDE for android development"'
sudo sh -c 'echo "Exec=/usr/bin/android-studio/bin/studio.sh"'
sudo sh -c 'echo "TryExec=/usr/bin/android-studio/bin/studio.sh"'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/android-studio.png"'
sudo sh -c 'echo "Terminal=false"'
sudo sh -c 'echo "Type=Application"'
sudo sh -c 'echo "Categories=Development;IDE;"'
xdg-desktop-menu install /usr/share/applications/android-studio.desktop

echo "Android Studio bundle has been installed"
