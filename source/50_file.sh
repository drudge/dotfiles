# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

# Limits.
unlimit
limit stack 8192
limit core 0 # No coredumps.
limit -s

# Always use color output for `ls`
if [[ "$OSTYPE" =~ "^darwin" ]]; then
  alias ls="ls -G"
else
  alias ls="ls --color=always"
  export LSCOLORS=dxfxcxdxbxegedabagacad
fi

export COLOR_PROMPT=yes
export force_colored_prompt=yes

# Directory listing
if [[ -x `which tree` ]]; then
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsd='ll -d'
else
  alias ll='ls -al'
  alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
fi

# Easier navigation: .., ..., -
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# File Extract
alias untar="tar xzfvv"           # for tarballs
alias unbz2="tar xvvfj"           # for .bz2 archives

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Aliasing eachdir like this allows you to use aliases/functions as commands.
alias eachdir=". eachdir"

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}