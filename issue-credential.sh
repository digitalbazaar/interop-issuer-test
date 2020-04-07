#!/bin/bash

if [ -z "$1" ]; then
  echo "First argument must be the hostname and port (e.g. localhost:39443)"
  exit 1
fi
HOST=$1
TOKEN=$2
curl -k -v -d @./mock-credential.json -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H "Authorization: Bearer $TOKEN" \
  https://"$HOST"/vc-issuer/issue | json_pp
