#!/bin/bash

check_if_present_in_bash_profile(){
  CMD='cat '$BASH_PROFILE_PATH' | grep -i "source '$1'" | wc -l'
  op=`eval "$CMD"`
  if [ $op -eq 0 ];then
    echo 'source '$1 >> $BASH_PROFILE_PATH
  fi
}

USERNAME=$USERNAME
DOTFILES_ROOT=$(pwd)
GIT_ALIASES_PATH=$DOTFILES_ROOT/git/aliases
SYS_ALIASES_PATH=$DOTFILES_ROOT/sys/aliases
BASH_PROFILE_PATH='/Users/'$USERNAME'/.bash_profile'
#set bash profile path depending on whether the system is wuindows or *nix .
CMD='uname -a | grep -i "MINGW" | wc -l'
op=`eval "$CMD"`
if [ $op -eq 1 ]; then
  BASH_PROFILE_PATH='/c/Users/'$USERNAME'/.bash_profile'
fi

if [ -e $GIT_ALIASES_PATH -a ! -x $GIT_ALIASES_PATH ]; then
  chmod +x $GIT_ALIASES_PATH
fi

if [ -e $SYS_ALIASES_PATH -a ! -x $SYS_ALIASES_PATH ]; then
  chmod +x $SYS_ALIASES_PATH
fi

if [ ! -e $BASH_PROFILE_PATH ]; then
  echo $BASH_PROFILE_PATH' Creating .bash_profile file at the path mentioned.'
  touch $BASH_PROFILE_PATH
fi

if [ -e $BASH_PROFILE_PATH -a -e $GIT_ALIASES_PATH -a -e $SYS_ALIASES_PATH ]; then
  check_if_present_in_bash_profile "$GIT_ALIASES_PATH"
  check_if_present_in_bash_profile "$SYS_ALIASES_PATH"
  echo "Aiases added."
else
  echo 'One or more files not found. PWD => '$DOTFILES_ROOT'.'
  echo 'GIT_ALIASES_PATH => '$GIT_ALIASES_PATH
  echo 'SYS_ALIASES_PATH => '$SYS_ALIASES_PATH
  echo ' The "install.sh" has to be run from inside the "dotfiles" folder.'
fi
  . $BASH_PROFILE_PATH
