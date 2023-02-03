#!/usr/bin/env bash

function main {
  local project_name="$(basename $PWD)"
  local container_tag="$project_name"-dev-environment

  docker build \
    -t "$container_tag" \
     --build-arg "USERNAME=$USER" \
     --build-arg "PASSWORD=password" \
     .

  docker run \
    --rm \
    --interactive \
    --tty \
    "$container_tag" \
    "bash"
}

main "$@"
