#!/bin/sh
set -e

echo "HTTP-checker starting..."

#INPUT_URLS="[5, 6, 10]"

RESP=$(/app/http-checker "$INPUT_URLS" "$INPUT_CODES" | tail -1)

echo "::set-output name=responses::${RESP}"
