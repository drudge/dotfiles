
#zmodload zsh/complist
autoload -U colors; colors
autoload zcalc
autoload -U zmv

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof

if [ -z "$VIMRUNTIME" ]; then
  zmodload -ap zsh/mapfile mapfile &>/dev/null
fi

## THIS REQUIRES OPTION AS META IN TERMINAL.APP :(
bindkey '\e\e[D' backward-word
bindkey '\e[3D' backward-word
bindkey '\e\e[C' forward-word
bindkey '\e[3C' forward-word

bindkey '\e[H' beginning-of-line # home
bindkey '\e[F' end-of-line # end

bindkey '^[[5D' beginning-of-line # ctl-left, osx
bindkey '^[[5C' end-of-line # ctl-right, osx

# fix mac backspace/delete keybindings
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

bindkey "^Xt" tetris ## C-x-t to play

bindkey '\e' undo

# Load completions
source $HOME/.dotfiles/conf/zsh/completions/base