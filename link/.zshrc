export ZGEN_RESET_ON_CHANGE=(${HOME}/.dotfiles/link/.zshrc)
export NVM_AUTO_USE=true
source "${HOME}/.dotfiles/libs/zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/nvm
    zgen load zsh-users/zsh-autosuggestions

    zgen load lukechilds/zsh-nvm

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load denysdovhan/spaceship-zsh-theme spaceship

    # save all to init script
    zgen save
fi

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

src