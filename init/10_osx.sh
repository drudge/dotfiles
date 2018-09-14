# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
PATH=/usr/local/bin:$(path_remove /usr/local/bin)
export PATH

e_header "Applying Preferences"
$HOME/.dotfiles/conf/osx_defaults.sh

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(type -P brew)" ]]; then
  e_header "Updating Homebrew"
  brew update

  # needed for updated rsync
  brew tap homebrew/dupes

  # Install Homebrew recipes.
  recipes=(git tree sl lesspipe id3tool nmap git-extras htop-osx rsync pv man2html the_silver_searcher mosh docker mas awscli terraform)

  list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew formulae: $list"
    brew install $list
  fi
  
  # Install Homebrew Casks.
  recipes=(alfred slack google-chrome sketch postico studio-3t sequel-pro tower shimo kaleidoscope paw 1password visual-studio-code mailplane daisydisk docker 1password-cli)
  list="$(to_install "${recipes[*]}" "$(brew cask list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew Casks: $list"
    brew cask install $list
  fi
  
  # Install Mac App Store apps.
  recipes=(904280696 407963104 1081203896 924726344 497799835 425424353 1295203466)
  list="$(to_install "${recipes[*]}" "$(mas list)")"
  if [[ "$list" ]]; then
    e_header "Installing Mac App Store apps: $list"
    mas install $list
  fi
  
fi
