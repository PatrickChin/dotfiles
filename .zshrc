
autoload -Uz promptinit
promptinit
prompt grml
zstyle ':prompt:grml:left:setup' items newline\
	change-root user at host path vcs newline\
	percent


# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# just type '...' to get '../..'
rationalise-dot() {
	local MATCH
	if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
		LBUFFER+=/
		zle self-insert
		zle self-insert
	else
		zle self-insert
	fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert

swap() {
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

if [ -f  /etc/profile.d/fzf.zsh ]; then
	source /etc/profile.d/fzf.zsh
fi

export VISUAL=vim
export EDITOR="$VISUAL"

alias emacs="emacs -nw"
alias firmwarereboot="sudo systemctl reboot --firmware-setup"
alias cpycm="cp ~/.vim/.ycm_extra_conf.py ."
alias cpnum="echo '0746 430 4048' | xsel -i -b"
alias info="info --vi-keys"
alias za=zathura
alias ra=ranger

