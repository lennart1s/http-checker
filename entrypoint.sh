#!/bin/sh
set -e

echo "HTTP-checker starting..."

RESP=$(/app/http-checker "$INPUT_URLS" "$INPUT_CODES")

echo "${RESP}"

echo "::set-output name=responses::${RESP}"

if [[ $RESP == *"<-fail"* ]]; then
  exit 1
fi
