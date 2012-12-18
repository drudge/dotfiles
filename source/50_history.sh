# History settings

HISTFILE=~/.zhistory
HISTSIZE=2000
SAVEHIST=2000

# append rather than overwrite history file
setopt APPEND_HISTORY 

# append history incrementally rather than waiting for shell to end
setopt INC_APPEND_HISTORY

# shares history across shells

setopt SHARE_HISTORY

# allow dups, but expire old ones when I hit HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST