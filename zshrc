autoload -Uz promptinit
promptinit
prompt grml
zstyle ':prompt:grml:left:setup' items change-root user at host path vcs newline percent

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt NO_BEEP

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

swap() {
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

if [ -f /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
fi

if [ -f /usr/share/fzf/completion.zsh ]; then
	source /usr/share/fzf/completion.zsh
fi

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export VISUAL=vim
export EDITOR="$VISUAL"

alias emacs="emacs -nw"
alias firmwarereboot="sudo systemctl reboot --firmware-setup"
alias cpycm="cp ~/.vim/.ycm_extra_conf.py ."
alias cpnum="echo '0746 430 4048' | xsel -i -b" # I guess this number is out there in the public ...
alias info="info --vi-keys"
alias ag='\ag --pager="less -XFR"'

alias workon_uxb="source /usr/bin/virtualenvwrapper.sh && workon uxb"
alias workon_ate="source /usr/bin/virtualenvwrapper.sh && workon ate"

source $HOME/uxb/cms_vars.sh

export PATH="/usr/lib/ccache:$PATH"
