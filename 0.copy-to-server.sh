#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'please enter destination, ie: ./copy-to-server.sh user@ip-address'
    exit 1
fi

CMD="rsync -a --progress --inplace ../scylladb-spark-demo ${1}:~/"

echo "executing: " ${CMD}
${CMD} 