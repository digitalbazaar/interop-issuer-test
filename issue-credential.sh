#!/bin/bash

if [ -z "$1" ]; then
  echo "First argument must be the hostname and port (e.g. localhost:39443)"
  exit 1
fi
HOST=$1
curl -k -v -d @./mock-credential.json -H 'Content-Type: application/json' -H 'Accept: application/json' https://"$HOST"/credentials/issueCredential | json_pp
