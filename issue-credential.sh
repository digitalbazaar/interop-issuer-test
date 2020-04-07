#!/bin/bash

if [ -z "$1" ]; then
  echo "First argument must be the hostname and port (e.g. localhost:39443)."
  exit 1
fi
if [ -z "$2" ]; then
  echo "Second argument must be an application token."
  exit 1
fi
HOST=$1
TOKEN=$2
UUID=$(uuidgen)
CREDENTIAL=$(<./mock-credential.json)
curl -k -v -d "${CREDENTIAL/_UUID_/$UUID}" \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H "Authorization: Bearer $TOKEN" \
  https://"$HOST"/vc-issuer/issue | json_pp
