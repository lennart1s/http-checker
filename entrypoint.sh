#!/bin/sh

echo "HTTP-checker starting..."

RESP=$(/app/http-checker "$INPUT_URLS" "$INPUT_CODES")

echo "${RESP}"

echo "::set-output name=responses::${RESP}"
