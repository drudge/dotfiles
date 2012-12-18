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

# From http://stackoverflow.com/questions/370047/#370255
function path_remove() {
  IFS=:
  # convert it to an array
  t=($PATH)
  unset IFS
  # perform any array operations to remove elements from the array
  t=(${t[@]%%$1})
  IFS=:
  # output the new array
  echo "${t[*]}"
}

# shortcut to get root
alias up="sudo $SHELL"