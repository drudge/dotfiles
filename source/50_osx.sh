# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ "^darwin" ]] || return 1

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }