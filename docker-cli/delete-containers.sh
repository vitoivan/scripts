#!/bin/bash

if [ "$1" = "delete-containers" ]; then

    containers=$(docker ps -a --format "{{.Names}}")

    if [ -z "$containers" ]; then
        echo "no containers found"
        exit 0
    fi


    selected=$(printf "$containers" | fzf --header="select a container to delete" -m)

    if [ -z "$selected" ]; then
        exit 0
    fi

    docker rm -f $selected


    exit 0
fi
