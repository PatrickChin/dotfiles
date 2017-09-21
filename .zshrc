
autoload -Uz promptinit
promptinit
prompt grml
zstyle ':prompt:grml:left:setup' items newline jobs path vcs newline change-root user at host percent


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


export VISUAL=nvim
export EDITOR="$VISUAL"

alias firmwarereboot="sudo systemctl reboot --firmware-setup"
alias cpycm="cp ~/.vim/.ycm_extra_conf.py ."
alias cpnum="echo '0747 430 4048' | xsel -i -b"
alias info="info --vi-keys"
alias za=zathura
alias ra=ranger

