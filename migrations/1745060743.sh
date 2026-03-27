#!/bin/bash

cp ~/.local/share/omakdeb/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/omakdeb/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/omakdeb/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/omakdeb/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $OMAKDEB_PATH/applications/About.sh
source $OMAKDEB_PATH/applications/Activity.sh
source $OMAKDEB_PATH/applications/Neovim.sh
source $OMAKDEB_PATH/applications/Docker.sh
source $OMAKDEB_PATH/applications/Omakdeb.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
