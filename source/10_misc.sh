export LC_ALL="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export FULL_NAME="Nicholas Penree"
export COMPANY="Weborate Labs"
export EMAIL="nick@penree.com"
export TZ="America/New_York"

# Debian: these are used by debian packaging programs

export DEBFULLNAME=$NAME
export DEBEMAIL=$EMAIL

# Git: these are used by git and will override anything in global config

export GIT_COMMITTER_NAME=$FULL_NAME
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_NAME=$FULL_NAME
export GIT_AUTHOR_EMAIL=$EMAIL

export PATH="/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# shortcut to get root
alias up="sudo $SHELL"