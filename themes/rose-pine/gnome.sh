#!/bin/bash

OMAKDEB_THEME_COLOR="red"
OMAKDEB_THEME_BACKGROUND="rose-pine/background.jpg"
source $OMAKDEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
