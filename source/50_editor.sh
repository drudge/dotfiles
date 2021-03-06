# Editing

if [[ "$OSTYPE" =~ "^darwin" ]]; then
  export VISUAL="code --wait"
  export EDITOR="code --wait"
  export LESSEDIT="code --wait %f"
  alias q="code"
else
  export EDITOR=$(type vi vim 2>/dev/null | sed 's/ .*$//;q')
  alias q="$EDITOR"
fi

export VISUAL="$EDITOR"

alias q.='q .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  q ~/.dotfiles
}