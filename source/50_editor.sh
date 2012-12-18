# Editing

if [[ ! -z "$SSH_TTY" && "$OSTYPE" =~ "^darwin" ]]; then
  export EDITOR='choc -w'
  export LESSEDIT='choc %f'
  alias q='choc'
else
  export EDITOR=$(type vi vim 2>/dev/null | sed 's/ .*$//;q')
  alias q="$EDITOR -w -z"
fi

export VISUAL="$EDITOR"

alias q.='q .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  q ~/.dotfiles
}