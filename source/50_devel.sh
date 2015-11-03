export PATH
export MONO_GAC_PREFIX="/usr/local"
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

alias dockercleancontainers="docker ps -a -notrunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias dockercleanimages="docker images -a -notrunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"

alias get_last_docker_deploy_log='echo "bin\nget /TWEC_Dev/Docker/last.log /tmp/last.log" | ftp i5dev.twec.com > /dev/null && cat /tmp/last.log && rm /tmp/last.log'

PATH=./node_modules/.bin:$(path_remove ./node_modules/.bin)
PATH=./.bin:$(path_remove ./.bin)
