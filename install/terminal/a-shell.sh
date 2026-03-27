#!/bin/bash

# Configure the bash shell using Omakdeb defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakdeb/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omakdeb/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omakdeb defaults
cp ~/.local/share/omakdeb/configs/inputrc ~/.inputrc
