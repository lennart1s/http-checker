#!/bin/bash
set -e

echo "HTTP-checker starting..."

RES=$(go run httpChecker.go)

echo "::set-output name=responses::$RES"
