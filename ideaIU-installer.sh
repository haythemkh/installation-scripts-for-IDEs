#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup idea
# --------------------------------------------------
echo "Installing idea..."
sudo mv idea-IU* /usr/lib/idea
sudo ln -s /usr/lib/idea /usr/lib/idea
sudo ln -s /usr/lib/idea/bin/idea.sh /usr/bin/idea
sudo cp /usr/lib/idea/bin/idea.png /usr/share/pixmaps/idea.png
sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Name=idea" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Comment=IDE for Java development" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Categories=Development;" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Exec=/usr/bin/idea" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/idea.png" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/jetbrains-idea.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/jetbrains-idea.desktop'
xdg-desktop-menu install /usr/share/applications/jetbrains-idea.desktop
tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10
# --------------------------------------------------
# Setup idea Upgrade
# --------------------------------------------------
echo "Setting up upgrade idea..."
mkdir ~/.local
cp platforms/linux/upgrade-idea.sh ~/.local/upgrade-idea.sh
echo 'alias upgrade idea="$HOME/.local/upgrade-idea.sh"' | tee -a ~/.bash_aliases
chmod 755 ~/.local/upgrade-idea.sh
if [ $?=0 ]
then echo "idea: installed"
else
echo "idea: failed"
exit 1
fi
