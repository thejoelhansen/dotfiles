#!/bin/sh

ln -is $(readlink -f ~/.dotfiles/bashrc) ~/.bashrc
ln -is $(readlink -f ~/.dotfiles/vimrc) ~/.vimrc
ln -is $(readlink -f ~/.dotfiles/build.log) ~/build.log
ln -is $(readlink -f ~/.dotfiles/gitconfig) ~/.gitconfig
