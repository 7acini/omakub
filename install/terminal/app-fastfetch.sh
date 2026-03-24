#!/bin/bash

# Display system information in the terminal
if [[ "$ID" == "ubuntu" || "$ID_LIKE" == *"ubuntu"* ]]; then
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
else
  # Debian and other Debian-based distros: fastfetch is in main repos or use direct install
  if ! apt-cache show fastfetch >/dev/null 2>&1; then
    # Fallback: download latest .deb from GitHub
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-x86_64.deb
    sudo dpkg -i fastfetch-x86_64.deb
    cd -
    rm -rf "$TEMP_DIR"
  fi
fi
sudo apt update -y
sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
