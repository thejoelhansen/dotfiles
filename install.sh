#!/bin/sh

ln -is $(readlink -f ~/.dotfiles/bashrc) ~/.bashrc
ln -is $(readlink -f ~/.dotfiles/vimrc) ~/.vimrc

