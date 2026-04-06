#!/bin/bash

sudo apt install python3-tk desktop-file-utils

chmod +x ./SoundSorcerer_GUI
mkdir -p ${HOME}/.local/bin
cp ./SoundSorcerer_GUI ${HOME}/.local/bin/SoundSorcerer_GUI

mkdir -p ${HOME}/.local/share/icons/hicolor/scalable/apps
cp ./SoundSorcerer.svg ${HOME}/.local/share/icons/hicolor/scalable/apps/
gtk-update-icon-cache "${HOME}/.local/share/icons/hicolor" >/dev/null 2>&1 || true

mkdir -p ${HOME}/.local/share/applications
cat > "${HOME}/.local/share/applications/SoundSorcerer_GUI.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=SoundSorcerer GUI
Comment=GUI to select sound output device
Exec=${HOME}/.local/bin/SoundSorcerer_GUI
TryExec=${HOME}/.local/bin/SoundSorcerer_GUI
Icon=SoundSorcerer
Terminal=false
StartupNotify=true
EOF

update-desktop-database "${HOME}/.local/share/applications"
