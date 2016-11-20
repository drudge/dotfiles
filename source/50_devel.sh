export PATH
export MONO_GAC_PREFIX="/usr/local"
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

alias docker-clean-containers='docker rm $(docker ps -aq)'
alias docker-clean-images='docker rmi $(docker images -q --filter dangling=true)'
alias docker-clean="docker-clean-containers && docker-clean-images"

alias get_last_docker_deploy_log='echo "bin\nget /TWEC_Dev/Docker/last.log /tmp/last.log" | ftp i5dev.twec.com > /dev/null && cat /tmp/last.log && rm /tmp/last.log'

PATH=./node_modules/.bin:$(path_remove ./node_modules/.bin)
PATH=./.bin:$(path_remove ./.bin)
PATH=$HOME/.yarn/bin:$(path_remove $HOME/.yarn/bin)
