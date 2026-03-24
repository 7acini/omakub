#!/bin/bash

# Mainline - GUI tool to manage mainline Linux kernels
if [[ "$ID" == "ubuntu" || "$ID_LIKE" == *"ubuntu"* ]]; then
  # Ubuntu: use PPA
  sudo add-apt-repository -y ppa:cappelikan/ppa
  sudo apt update -y
  sudo apt install -y mainline
else
  # Debian and other Debian-based: download from official site
  TEMP_DIR=$(mktemp -d)
  cd "$TEMP_DIR"
  wget -q https://github.com/bkw777/mainline/releases/latest/download/mainline-amd64.deb
  sudo dpkg -i mainline-amd64.deb || sudo apt install -f -y
  cd -
  rm -rf "$TEMP_DIR"
fi
