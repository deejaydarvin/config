#!/bin/sh

git clone --depth 1 http://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

homeshick clone deejaydarvin/config
# homeshick clone git@github.com:deejaydarvin/config.git

git clone --depth 1 https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
