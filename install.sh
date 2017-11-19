#! /usr/bin/bash


configdirs="i3 i3blocks vim zathura"
dotfiles="xinitrc xprofile Xresources zshenv zshrc vim"

for d in $configdirs; do
	echo ln -s ./$d ~/.config/$d
	ln -s $PWD/$d ~/.config/$d
done

for f in $dotfiles; do
	echo ln -s ./$f ~/.$f
	ln -s $PWD/$f ~/.$f
done

ln -s $PWD/vim/init.vim ~/.vimrc
