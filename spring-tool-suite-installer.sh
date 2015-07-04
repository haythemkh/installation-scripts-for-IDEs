#!/bin/sh
# To execute this file, you must:
#  * rename ./icon.xpm to spring-tool-studio.xpm
# --------------------------------------------------
echo "Installing spring-tool-suite..."
sudo mv spring* /usr/lib/spring-tool-suite
sudo ln -s /usr/lib/spring-tool-suite /usr/lib/spring-tool-suite
sudo ln -s /usr/lib/spring-tool-suite/STS /usr/bin/
sudo cp /usr/lib/spring-tool-suite/spring-tool-suite.png /usr/share/pixmaps/
sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Name=STS" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Comment=IDE for JavaEE/Spring development" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Categories=Development;IDE;" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Exec=/usr/bin/STS" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/spring-tool-suite.png" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/spring-tool-suite.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/spring-tool-suite.desktop'
xdg-desktop-menu install /usr/share/applications/spring-tool-suite.desktop
tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10
# --------------------------------------------------
# Setup spring-tool-suite Upgrade
# --------------------------------------------------
echo "Setting up upgradespring-tool-suite..."
mkdir ~/.local
cp platforms/linux/upgrade-spring-tool-suite.sh ~/.local/upgrade-spring-tool-suite.sh
echo 'alias upgradespring-tool-suite="$HOME/.local/upgrade-spring-tool-suite.sh"' | tee -a ~/.bash_aliases
chmod 755 ~/.local/upgrade-spring-tool-suite.sh
if [ $?=0 ]
then echo "spring-tool-suite: installed"
else
echo "spring-tool-suite: failed"
exit 1
fi
