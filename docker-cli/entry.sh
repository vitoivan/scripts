#!/bin/bash

here=$(dirname $0)
seleceted=$(printf 'delete-containers\ndelete-images' | fzf --header="select an option" --header-first)

if [ -z "$seleceted" ]; then
    exit 0
fi


if [ "$seleceted" = "delete-containers" ]; then
    $here/delete-containers.sh delete-containers
fi

if [ "$seleceted" = "delete-images" ]; then
    $here/delete-images.sh delete-images
fi

# actions=$(echo "port-forward logs describe-pod" | tr " " "\n")
# docker_path="$here/docker"
