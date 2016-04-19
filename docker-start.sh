#! /bin/bash
# Program:
#       Start docker container by name
# Usage:
#   ./docker-start.sh {container name}
#   
#   If you don't inputs any container name, program will start the first
#   container at list.

args=("$@")
name=${args[0]}

docker start $(docker ps -a -q -f NAME=${name}) &> /dev/null

if [ $? -eq 0 ]
then
    docker exec -i -t $(docker ps -a -q -f NAME=${name}) bash
else
    echo "Container not found!" >&2
fi
