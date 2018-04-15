if [ -x /usr/bin/docker ] 
then
dcleanup(){
	local containers
	containers=( $(docker ps -aq 2>/dev/null) )
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	volumes=( $(docker ps --filter status=exited -q 2>/dev/null) )
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	images=( $(docker images --filter dangling=true -q 2>/dev/null) )
	docker rmi "${images[@]}" 2>/dev/null
}
del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}
relies_on(){
	for container in "$@"; do
		local state
		state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}

# Alias #

alias dps="docker ps"
alias dexec="docker exec -ti"
alias dc="docker-compose"
alias dcps="docker-compose ps"
alias dcupd="docker-compose up -d"
alias drm_exited="docker rm -v $(docker ps -a -q -f status=exited)"
fi
