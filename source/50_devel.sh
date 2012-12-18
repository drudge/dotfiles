export PATH

# nave init.
if [ -x `which nave` ]; then
  nave_default="$(nave ls | awk '/^default/ {print $2}')"
  if [[ -w "$nave_default" && "$(node --version 2>/dev/null)" != "v$nave_default" ]]; then
    node_path=~/.nave/installed/$nave_default/bin
    if [ -d "$node_path" ]; then
      PATH=$node_path:$(path_remove ~/.nave/installed/*/bin)
    fi
  fi
fi

npm_globals=(jake json)

# Fetch and build the latest stable Node.js, assigning it the alias "default"
alias nave_stable='nave use default stable nave_stable_2 $(node --version 2>/dev/null); src'
function nave_stable_2() {
  npm update -g npm
  if [[ "$1" != "$(node --version 2>/dev/null)" ]]; then
    echo "Node.js version updated to $1, installing Npm global modules."
    npm install -g ${npm_globals[*]}
  else
    echo "Node.js version $1 unchanged."
  fi
}

PATH=./node_modules/.bin:$(path_remove ./node_modules/.bin)
PATH=./.bin:$(path_remove ./.bin)
