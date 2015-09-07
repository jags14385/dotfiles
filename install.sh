#!/bin/bash

USERNAME=$USER
DOTFILES_ROOT=$(pwd)
GIT_ALIASES_PATH=$DOTFILES_ROOT/git/aliases.sh
SYS_ALIASES_PATH=$DOTFILES_ROOT/sys/aliases.sh
BASH_PROFILE_PATH='/Users/'$USERNAME'/.bash_profile'

if [ -e $BASH_PROFILE_PATH -a -e $GIT_ALIASES_PATH -a -e $SYS_ALIASES_PATH ]; then
  echo $GIT_ALIASES_PATH >> $BASH_PROFILE_PATH
  echo $SYS_ALIASES_PATH >> $BASH_PROFILE_PATH
  source $BASH_PROFILE_PATH
else
  echo '.bash_profile not found. PWD == > $DOTFILES_ROOT.'
  echo ' The "install.sh" has to be run from inside the "dotfiles" folder.'
fi
