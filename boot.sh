#!/bin/bash

set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
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
