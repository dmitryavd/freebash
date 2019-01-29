#!/bin/bash

set USER=$1

main() {
  HOST=(
    "host01"
    "host02"
    "host10"
  )

  for HOST in "${HOST[@]}"; do
    ssh $USER@$HOST "cd ~ && wget https://gist.github.com/aamnah/f03c266d715ed479eb46/raw/758ef5aa1e05d5b518b74638865bc2029a5a1fe7/lamp.sh && chmod -x ./lamp.sh && bash ./lamp.sh"
  done
}

main

