#!/bin/sh -l

echo "Hello $1"

echo $INPUT_X

time=$(date)

echo "::set-output name=y::'$time"