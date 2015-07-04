#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup Android studio
# --------------------------------------------------
echo "Installing android-studio..."
sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Name=Android studio" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Comment=IDE for android development" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Categories=Development;" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Exec=/usr/bin/android-studio" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/android-studio.png" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/android-studio.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/android-studio.desktop'
xdg-desktop-menu install /usr/share/applications/android-studio.desktop
tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10
# --------------------------------------------------
# Setup android-studio Upgrade
# --------------------------------------------------
echo "Setting up upgradeandroid-studio..."
mkdir ~/.local
cp platforms/linux/upgrade-android-studio.sh ~/.local/upgrade-android-studio.sh
echo 'alias upgradeandroid-studio="$HOME/.local/upgrade-android-studio.sh"' | tee -a ~/.bash_aliases
chmod 755 ~/.local/upgrade-android-studio.sh
if [ $?=0 ]
then echo "android-studio: installed"
else
echo "android-studio: failed"
exit 1
fi
