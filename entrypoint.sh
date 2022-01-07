#!/bin/sh
set -e

echo "HTTP-checker starting..."

#INPUT_URLS="[5, 6, 10]"

RESP=$(/app/http-checker "$INPUT_URLS")

echo "::set-output name=responses::${RESP}"
