#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $OMAKDEB_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $OMAKDEB_PATH/applications/About.sh
source $OMAKDEB_PATH/applications/Activity.sh
source $OMAKDEB_PATH/applications/Basecamp.sh
source $OMAKDEB_PATH/applications/HEY.sh
source $OMAKDEB_PATH/applications/Docker.sh
source $OMAKDEB_PATH/applications/Neovim.sh
source $OMAKDEB_PATH/applications/Omakdeb.sh
source $OMAKDEB_PATH/applications/WhatsApp.sh
