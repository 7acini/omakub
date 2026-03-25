#!/bin/bash

# Load system variables like $ID and $VERSION_CODENAME
. /etc/os-release

# Install Ulauncher based on distribution
if [[ "$ID" == "ubuntu" ]]; then
  # Add PPA manually for Ubuntu using version codename
  echo "deb [trusted=yes] https://ppa.launchpadcontent.net/agornostal/ulauncher/ubuntu $VERSION_CODENAME main" | sudo tee /etc/apt/sources.list.d/ulauncher.list >/dev/null
  sudo apt update && sudo apt install ulauncher -y
else
  # Download and install latest .deb for Debian/others
  TEMP_DIR=$(mktemp -d)
  cd "$TEMP_DIR"
  wget -q https://github.com/Ulauncher/Ulauncher/releases/latest/download/io.ulauncher.Ulauncher_amd64.deb
  sudo apt install -y ./io.ulauncher.Ulauncher_amd64.deb
  cd - > /dev/null
  rm -rf "$TEMP_DIR"
fi

# Setup autostart and initial configuration
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # Wait for config initialization
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json