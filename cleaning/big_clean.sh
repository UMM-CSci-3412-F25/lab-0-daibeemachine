#!/usr/bin/env bash

WORKING_DIRECTORY=$(pwd)
FILE_NAME="cleaned_"
FILE_NAME+="$(basename $(realpath "$1"))"
FILE_NAME_ONLY="$(basename $(realpath "$1") .tgz)"
SCRATCH=$(mktemp --directory)
echo $SCRATCH
echo $FILE_NAME
tar zxf "$1" --directory "$SCRATCH"
grep -lr "DELETE ME!" "$SCRATCH" | xargs rm
cd $SCRATCH
tar -czf $FILE_NAME "$FILE_NAME_ONLY"
mv "$FILE_NAME" "$WORKING_DIRECTORY"
cd $WORKING_DIRECTORY
