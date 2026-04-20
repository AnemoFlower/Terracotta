#!/bin/bash

shopt -s nullglob
mkdir -p flatten_artifacts
for dir in artifacts/*/; do
  file="$(find "$dir" -maxdepth 1 -type f | head -n 1)"
  if [ -n "$file" ]; then
    name="$(basename "$dir")"

    if [[ "$name" == *.tar ]]; then
      tar -xOf "$file" > "flatten_artifacts/${name%.tar}"
    else
      mv "$file" "flatten_artifacts/$name"
    fi
  fi
done