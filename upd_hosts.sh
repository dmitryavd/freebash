#!/bin/bash

set USER=$1

main() {
  HOST=(
    "host01"
    "host02"
    "host10"
  )

  for HOST in "${HOST[@]}"; do
    ssh $USER@$HOST "wget --no-check-certificate --content-disposition https://github.com/dmitryavd/freebash/archive/master.zip && unzip freebash-master.zip && cd freebash-master && chmod -x ./lamp.sh && bash ./lamp.sh" "cd ~ && wget https://github.com/dmitryavd/freebash/blob/master/lamp.sh && chmod -x ./lamp.sh && bash ./lamp.sh"
  done
}

main

