# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ "^darwin" ]] || return 1

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }


local DOCKER_VM_NAME="default"
local DOCKER_VM_DRIVER="vmwarefusion"
local DOCKER_VM_EXISTS="$(docker-machine inspect $DOCKER_VM_NAME 2>/dev/null)"

if [[ $DOCKER_VM_EXISTS != "" ]]; then
  # docker-machine create --driver $DOCKER_VM_DRIVER $DOCKER_VM_NAME

  if [[ "$(docker-machine status $DOCKER_VM_NAME)" != "Running" ]]; then
    docker-machine start $DOCKER_VM_NAME && eval "$(docker-machine env $DOCKER_VM_NAME)"
  else
    eval "$(docker-machine env $DOCKER_VM_NAME)"
  fi
else
  read -q "REPLY?Docker machine named '$DOCKER_VM_NAME' does not exist, create? [y/N] "
  echo "\n"
  case $REPLY in
      [yY][eE][sS]|[yY])
          docker-machine create --driver "$DOCKER_VM_DRIVER" "$DOCKER_VM_NAME"
          eval "$(docker-machine env $DOCKER_VM_NAME)"
          ;;
      *)
          ;;
  esac
fi