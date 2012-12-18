
# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [ "$1"  ]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

# load my defined functions
for file in $HOME/.dotfiles/conf/zsh/functions/*; do
  source $file
done

src