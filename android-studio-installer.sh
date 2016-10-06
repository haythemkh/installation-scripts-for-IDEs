#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup Android studio
# --------------------------------------------------
echo "Downloading and extracting Android Studio bundle..."
sudo wget http://dl.google.com/android/studio/android-studio-bundle-132.883541-linux.tgz -O android-studio.tgz
sudo mv android-studio.tgz /usr/bin/
sudo tar -xvzf /usr/bin/android-studio.tgz -C /usr/bin/
sudo rm /usr/bin/android-studio.tgz

echo "Installing android-studio..."
# Create the /usr/share/pixmaps/ dir if it doesn't exist
if [ ! -d /usr/share/pixmaps/ ]; then
       sudo mkdir /usr/share/pixmaps/
fi
sudo cp /usr/bin/android-studio/bin/studio.png /usr/share/pixmaps/android-studio.png

# Setup of the .desktop file
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Comment=Android Studio bundle
Categories=Development;IDE;
Exec=/usr/bin/android-studio/bin/android-studio.sh
Icon=/usr/share/pixmaps/android-studio.png
Terminal=false" >> /usr/share/applications/android-studio.desktop
xdg-desktop-menu install /usr/share/applications/android-studio.desktop

echo "Android Studio bundle has been installed"
