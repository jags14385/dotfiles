#!/bin/bash

USERNAME=$USER
DOTFILES_ROOT=$(pwd)
GIT_ALIASES_PATH=$DOTFILES_ROOT/git/aliases.sh
SYS_ALIASES_PATH=$DOTFILES_ROOT/sys/aliases.sh
BASH_PROFILE_PATH='/Users/'$USERNAME'/.bash_profile'

#Checking if the file exists and has execute permissions
if [ -e $GIT_ALIASES_PATH -a ! -x $GIT_ALIASES_PATH ]; then
  chmod +x $GIT_ALIASES_PATH
fi
