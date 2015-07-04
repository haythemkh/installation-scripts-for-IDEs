#!/bin/sh
# sudo sh -c "echo $data >>$logfile"
# --------------------------------------------------
# Setup argoUML 2
# --------------------------------------------------
echo "Installing argoUML..."
sudo mv argouml /usr/lib/argoUML
sudo ln -s /usr/lib/argoUML /usr/lib/argoUML
sudo ln -s /usr/lib/argoUML/argouml.sh /usr/bin/argoUML
sudo cp /usr/lib/argoUML/icob/argouml2.svg /usr/share/pixmaps/argoUML.png
sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Name=ArgoUML" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Comment=UML tool" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Categories=Development;" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Exec=/usr/bin/argoUML" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/argoUML.png" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/argoUML.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/argoUML.desktop'
xdg-desktop-menu install /usr/share/applications/argoUML.desktop
tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10
# --------------------------------------------------
# Setup argoUML Upgrade
# --------------------------------------------------
echo "Setting up upgrade argoUML..."
mkdir ~/.local
cp platforms/linux/upgrade-argoUML.sh ~/.local/upgrade-argoUML.sh
echo 'alias upgrade argoUML="$HOME/.local/upgrade-argoUML.sh"' | tee -a ~/.bash_aliases
chmod 755 ~/.local/upgrade-argoUML.sh
if [ $?=0 ]
then echo "argoUML: installed"
else
echo "argoUML: failed"
exit 1
fi
