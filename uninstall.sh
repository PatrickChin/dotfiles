#! /usr/bin/bash

configdirs="i3 i3blocks vim zathura"
dotfiles="xinitrc xprofile Xresources zshenv zshrc vim"

for d in $configdirs; do
	echo ~/.config/$d
	rm ~/.config/$d
done

for f in $dotfiles; do
	echo ~/.$f
	rm ~/.$f
done

rm ~/.vimrc
