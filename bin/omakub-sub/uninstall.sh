#!/bin/bash

UNINSTALLER=$(gum file $OMAKDEB_PATH/uninstall --height 26)
[ -n "$UNINSTALLER" ] && gum confirm "Run uninstaller?" && source $UNINSTALLER && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
clear
source $OMAKDEB_PATH/bin/omakdeb
