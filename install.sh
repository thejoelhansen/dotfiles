#!/bin/sh

ln -is $(readlink -f ~/.dotfiles/bashrc) ~/.bashrc
ln -is $(readlink -f ~/.dotfiles/vimrc) ~/.vimrc
ln -is $(readlink -f ~/.dotfiles/zshrc) ~/.zshrc
ln -is $(readlink -f ~/.dotfiles/build.log) ~/build.log
ln -is $(readlink -f ~/.dotfiles/gitconfig) ~/.gitconfig
ln -is $(readlink -f ~/.dotfiles/.config) ~/.config

var_check=$(cat ~/.bash_profile | grep "dotfiles/bin")
if [ -z "$var_check" ]; then
	echo 'export PATH="$HOME/.dotfiles/bin:$PATH"' >> ~/.bash_profile
fi
