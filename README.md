A framework for loading one's own shortcuts to the shell.

Inspired from dotfiles.github.io

* Look at the code, to understand how it works

* How to Use:
    ** Copy the code to the .bash_profile /.bashrc

DOTFILES_ROOT=$(pwd)

for DOTFILE in `find ~/code/dotfiles/aliases` 

do 

   [ -f $DOTFILE ] && source $DOTFILE 

done 
