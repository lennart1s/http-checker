#!/bin/sh
set -e

echo "HTTP-checker starting..."

#INPUT_URLS="[5, 6, 10]"

RESP=$(./http-checker "$INPUT_URLS")
echo "${RESP}"

echo "::set-output name=responses::${RESP}"
