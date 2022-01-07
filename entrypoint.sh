#!/bin/bash
set -e

echo "HTTP-checker starting..."

RESP=$(ls -al)
echo "ls: ${RESP}"

echo "::set-output name=responses::$INPUT_URLS"
