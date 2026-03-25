#!/bin/bash

# Load system variables like $ID and $VERSION_CODENAME
. /etc/os-release

# Install fastfetch based on distribution
if [[ "$ID" == "ubuntu" ]]; then
  # Add PPA manually for Ubuntu using version codename
  echo "deb [trusted=yes] https://ppa.launchpadcontent.net/zhangsongcui3371/fastfetch/ubuntu $VERSION_CODENAME main" | sudo tee /etc/apt/sources.list.d/fastfetch.list >/dev/null
  sudo apt update -y
  sudo apt install -y fastfetch
else
  # Check repository or download from GitHub for Debian/others
  if ! apt-cache show fastfetch >/dev/null 2>&1; then
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb
    sudo apt install -y ./fastfetch-linux-amd64.deb
    cd - > /dev/null
    rm -rf "$TEMP_DIR"
  fi
  sudo apt update -y
  sudo apt install -y fastfetch
fi

# Set Omakub configuration if not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi