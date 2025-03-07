#!/usr/bin/env zsh

set -e

if [[ -z $1 ]]; then
    docker pull debian:bookworm-slim
fi

for part in base dash zlib pcre pcre2 bash coreutils findutils git grep make sed jq yq ncurses less nextvi zsh; do
    file="Dockerfile_$part"
    if [[ -n $1 && $1 != "$part" ]]; then continue; fi
    docker build --file "$file" --tag "middagj/kaniko-$part" .
done

if [[ -z $1 ]]; then
    tag="$(sed -nE 's/^FROM [^:]+:([^ ]+)/\1/p' Dockerfile | tail -n 1)"
    docker build --squash --tag "middagj/kaniko:$tag" .
    docker push "middagj/kaniko:$tag"
    if [[ "$(git rev-parse --abbrev-ref HEAD)" == 'main' ]]; then
        docker tag "middagj/kaniko:$tag" "middagj/kaniko:latest"
        docker push "middagj/kaniko:latest"
    fi
fi
