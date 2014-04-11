#!/bin/sh

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

homeshick clone deejaydarvin/config
# homeshick clone git@github.com:deejaydarvin/config.git

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.homesick/repos/zsh-syntax-highlighting

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
