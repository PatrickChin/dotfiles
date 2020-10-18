#! /usr/bin/env bash

# set -x

configdirs="i3 i3blocks vim zathura"
dotfiles="xinitrc xprofile Xresources zshenv zshrc"

for d in $configdirs; do
	if [ ! -d ~/.config/$d ] ; then
		ln -s $PWD/$d ~/.config/$d
	else
		echo "Dir ~/.config/$d already exists, skipping"
	fi
done

for f in $dotfiles; do
	if [ ! -f ~/.$f ] ; then
		ln -s $PWD/$f ~/.$f
	else
		echo "File ~/.$f already exists, skipping"
	fi
done

if [ ! -f ~/.$f ] ; then
	ln -s $PWD/vim/init.vim ~/.vimrc
fi
