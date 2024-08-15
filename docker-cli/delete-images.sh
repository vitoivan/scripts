#!/bin/bash

if [ "$1" = "delete-images" ]; then

    images=$(docker images -a --format "{{.Repository}}:{{.Tag}}")

    if [ -z "$images" ]; then
        echo "no images found"
        exit 0
    fi


    selected=$(printf "$images" | fzf --header="select the images that you want to delete" -m)

    if [ -z "$selected" ]; then
        exit 0
    fi

    docker rmi -f $selected

    exit 0
fi
