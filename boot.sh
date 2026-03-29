#!/bin/bash

set -e

ascii_art='
________                  __       .___    ___.
\_____  \   _____ _____  |  | __ __| _/____\_ |__
 /   |   \ /     \\__  \ |  |/ // __ |/ __ \| __ \
/    |    \  Y Y  \/ __ \|    </ /_/ \  ___/| \_\ \
\_______  /__|_|  (____  /__|_ \____ |\___  >___  /
        \/      \/     \/     \/    \/    \/    \/
'

echo -e "$ascii_art"
echo "=> Omakdeb is for fresh distros Debian-based installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakdeb..."
rm -rf ~/.local/share/omakdeb
git clone https://github.com/7acini/omakdeb.git ~/.local/share/omakdeb >/dev/null
if [[ $OMAKDEB_REF != "master" ]]; then
	cd ~/.local/share/omakdeb
	git fetch origin "${OMAKDEB_REF:-stable}" && git checkout "${OMAKDEB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakdeb/install.sh
