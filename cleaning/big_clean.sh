#!/usr/bin/env bash

WORKING_DIRECTORY=$(pwd)
FILE_NAME="cleaned_"
FILE_NAME+="$(basename $(realpath "$1"))"
SCRATCH=$(mktemp --directory)


echo $SCRATCH
echo $FILE_NAME
tar zxf "$1" --directory "$SCRATCH"
grep -lr "DELETE ME!" "$SCRATCH" | xargs rm
cd $SCRATCH
tar -czf $FILE_NAME .
ls
mv "$FILE_NAME" "$WORKING_DIRECTORY"
cd $WORKING_DIRECTORY

rm -rf $SCRATCH
