#!/bin/sh
#set -e

echo "HTTP-checker starting..."

RESP=$(/app/http-checker "$INPUT_URLS" "$INPUT_CODES")
#RESP="'https://google.com': 200, 'https://sandbothe.dev': 503<-fail"

echo "${RESP}"

echo "::set-output name=responses::${RESP}"

if [[ $RESP == *"<-fail"* ]]; then
  echo "Fail!"
  exit 1
fi

echo "Done"
