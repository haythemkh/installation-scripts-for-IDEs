#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup phpstorm 2
# --------------------------------------------------
echo "Installing phpstorm..."
sudo ln -s /usr/lib/phpstorm /usr/lib/phpstorm
sudo ln -s /usr/lib/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm
sudo cp /usr/lib/phpstorm/bin/webide.png /usr/share/pixmaps/phpstorm.png
sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Name=phpstorm" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Comment=IDE for web development" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Categories=Development;" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Exec=/usr/bin/phpstorm" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/webide.png" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/jetbrains-phpstorm.desktop'
xdg-desktop-menu install /usr/share/applications/jetbrains-phpstorm.desktop
tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10
# --------------------------------------------------
# Setup phpstorm Upgrade
# --------------------------------------------------
echo "Setting up upgrade phpstorm..."
mkdir ~/.local
cp platforms/linux/upgrade-phpstorm.sh ~/.local/upgrade-phpstorm.sh
echo 'alias upgrade phpstorm="$HOME/.local/upgrade-phpstorm.sh"' | tee -a ~/.bash_aliases
chmod 755 ~/.local/upgrade-phpstorm.sh
if [ $?=0 ]
then echo "phpstorm: installed"
else
echo "phpstorm: failed"
exit 1
fi
