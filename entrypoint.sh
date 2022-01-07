#!/bin/bash
set -e

echo "HTTP-checker starting..."

RES=$(./checker)

echo "::set-output name=responses::$RES"
