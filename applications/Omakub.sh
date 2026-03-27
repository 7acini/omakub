#!/bin/bash

cat <<EOF >~/.local/share/applications/Omakdeb.desktop
[Desktop Entry]
Version=1.0
Name=Omakdeb
Comment=Omakdeb Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omakdeb --title=Omakdeb -e omakdeb
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakdeb/applications/icons/Omakdeb.png
Categories=GTK;
StartupNotify=false
EOF
