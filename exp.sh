#!/bin/bash
#Place holder code used to spike stuff
USERNAME=$USER
DOTFILES_ROOT=$(pwd)
GIT_ALIASES_PATH=$DOTFILES_ROOT/git/aliases
SYS_ALIASES_PATH=$DOTFILES_ROOT/sys/aliases
BASH_PROFILE_PATH='/Users/'$USERNAME'/.bash_profile'

echo_var(){
  CMD_CAT='cat '$BASH_PROFILE_PATH' | grep -i "source '$1'" | wc -l'
  echo $CMD_CAT
  ad=`eval "$CMD_CAT"`
  echo $ad
  if [ $ad -eq 1 ]; then
    echo "Y"
  else
    echo "N"
  fi
}

#Checking if the file exists and has execute permissions
if [ -e $GIT_ALIASES_PATH -a ! -x $GIT_ALIASES_PATH ]; then
  chmod +x $GIT_ALIASES_PATH
fi

#Checking if the files are already added to the bash profile
echo_var "$GIT_ALIASES_PATH"
