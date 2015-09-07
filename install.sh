#!/bin/bash

DOTFILES_ROOT=$(pwd)
EXP_PATH=$DOTFILES_ROOT/exp.sh

if [ -f '~/.bash_profile' ]; then
  echo $PATH >> ~/.bash_profile
  source $HOME/.bash_profile
  cat $HOME/.bash_profile
else
  echo 'n'
  echo `source $PATH`
fi

if [ -f '$HOME/.bashrc' ]; then
  source $HOME/.bashrc
else
  echo 'n1'
fi
