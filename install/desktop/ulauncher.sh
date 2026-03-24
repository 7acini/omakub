#!/bin/bash

# Add universe repo (Ubuntu only)
if [[ "$ID" == "ubuntu" ]]; then
  sudo add-apt-repository universe -y
fi

# Install Ulauncher
if [[ "$ID" == "ubuntu" || "$ID_LIKE" == *"ubuntu"* ]]; then
  # Ubuntu: use PPA for latest version
  sudo add-apt-repository ppa:agornostal/ulauncher -y
  sudo apt update
  sudo apt install ulauncher -y
else
  # Debian and other Debian-based: download official .deb
  TEMP_DIR=$(mktemp -d)
  cd "$TEMP_DIR"
  wget -q https://github.com/Ulauncher/Ulauncher/releases/latest/download/io.ulauncher.Ulauncher_amd64.deb
  sudo dpkg -i io.ulauncher.Ulauncher_amd64.deb || sudo apt install -f -y
  cd -
  rm -rf "$TEMP_DIR"
fi

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
