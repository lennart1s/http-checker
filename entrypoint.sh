#!/bin/bash
set -e


envvar=${INPUT_URLS}
echo $INPUT_URLS

echo "::set-output name=status_codes::${INPUT_URLS}"
