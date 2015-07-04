#!/bin/bash
#
# An installer for Eclipse archives in Debian/Ubuntu/Mint
#
# Copyright (C) 2014 Haythem Khiri <haythem.khiri@yahoo.fr>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/gpl.html>
#
# ---------------------------------------------------------------------------
MACHINE_TYPE=`uname -m`

# Checks that the script is running as root, if not
# it will ask for permissions
# Source: http://unix.stackexchange.com/a/28796
# Root permissions check from http://askubuntu.com/a/30182
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo "$0" "$@"
   exit
fi

#echo "Downloading Eclipse"

#cd /tmp

#if [ ${MACHINE_TYPE} == 'x86_64' ]; then
#	wget http://cdn.mirror.garr.it/mirror3/mirrors/eclipse//technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz -O Eclipse.tar.gz
#else
#	wget http://cdn.mirror.garr.it/mirror3/mirrors/eclipse//technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk.tar.gz -O Eclipse.tar.gz
#fi

# Create the /opt dir if it doesn't exist
if [ ! -d /opt/ ]; then
	mkdir /opt/
fi

echo "Extracting Eclipse to /opt"

#unzip -q AptanaStudio.zip -d /opt/
tar zxf eclipse*.tar.gz -C /opt/

echo "Adding Eclipse desktop entry"

# Create the /usr/local/share/icons dir if it doesn't exist
if [ ! -d /usr/local/share/icons/ ]; then
	mkdir /usr/local/share/icons/
fi

# Fix for large icon problem
cp /opt/eclipse/icon.xpm /usr/local/share/icons/eclipse.xpm

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Eclipse CDT
GenericName=Integrated Development Environment
Comment=Eclipse CDT Integrated Development Environment
Exec=/opt/eclipse/eclipse-cdt
TryExec=/opt/eclipse/eclipse-cdt
Icon=eclipse-cdt
Terminal=false
Type=Application
MimeType=text/xml;application/xhtml+xml;application/x-javascript;application/x-php;application/x-java;text/x-javascript;text/html;text/plain
Categories=GNOME;Development;IDE;" >> /tmp/Eclipse-CDT.desktop
xdg-desktop-menu install /tmp/Eclipse-CDT.desktop

echo "Eclipse has been installed"
