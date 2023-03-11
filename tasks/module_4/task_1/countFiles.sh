#!/bin/sh

countFiles () {
    local dir=$1
    local count=$(find "$dir" -type f | wc -l)
    echo -e "\033[1;37m$dir: \033[0;34m$count files\033[0m"
}

for dir in "$@"; do
    subdirectories=$(find $dir -type d)

    find $dir -type d | while read LINE; do countFiles "$LINE" ; done
done