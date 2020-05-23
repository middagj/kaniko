#!/usr/bin/env zsh

set -e

if [[ -z $1 ]]; then
    docker pull debian:buster-slim
fi

for part in base zlib pcre bash coreutils findutils git grep; do
    file="Dockerfile_$part"
    if [[ -n $1 && $1 != "$part" ]]; then continue; fi
    docker build --file "$file" --tag "middagj/kaniko-$part" .
done

if [[ -z $1 ]]; then
    docker build --tag middagj/kaniko .
    docker push middagj/kaniko:latest
fi
