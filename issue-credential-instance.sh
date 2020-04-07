#!/bin/bash

if [ -z "$1" ]; then
  echo "First argument must be the hostname and port (e.g. localhost:39443)"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Second argument must a profile agent ID."
  exit 1
fi
HOST=$1
INSTANCE=$2
UUID=$(uuidgen)
CREDENTIAL=$(<./mock-credential.json)
echo $CREDENTIAL
curl -k -v -d "${CREDENTIAL/_UUID_/$UUID}" -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  https://"$HOST"/credentials/"$INSTANCE"/issueCredential | json_pp
