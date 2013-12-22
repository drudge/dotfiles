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

#export PATH="/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# From http://stackoverflow.com/questions/370047/#370255
if [[ "${ZSH_VERSION}" != "" ]]; then
function path_remove() {
  IFS=:
  # convert it to an array
  t=("${(s/:/)PATH}")
  unset IFS
  # perform any array operations to remove elements from the array
  t=(${t[@]%%$1})
  IFS=:
  # output the new array
  echo "${t[*]}"
}
else
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
fi


PATH=/opt/local/bin:$(path_remove /opt/local/bin)
PATH=/usr/local/bin:$(path_remove /usr/local/bin)
PATH=~/.dotfiles/bin:$(path_remove ~/.dotfiles/bin)

# shortcut to get root
alias up="sudo $SHELL"
alias irc="ssh irssi@irc.penree.com -p 8022"