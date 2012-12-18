setopt CORRECT			# command CORRECTION
setopt MENUCOMPLETE
setopt ALL_EXPORT
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs transientrprompt
setopt nobeep nohup completeinword autoresume pushdsilent 
setopt autopushd pushdminus extendedglob rcquotes mailwarning

unsetopt promptcr bgnice autoparamslash 

export GREP_OPTIONS='--color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR