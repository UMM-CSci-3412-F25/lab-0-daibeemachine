#!/usr/bin/env bash

WORKING_DIRECTORY=$(pwd)
COMPRESSED_FILE=$(dirname "$(realpath "$0")")
FOLDER="$COMPRESSED_FILE"
FOLDER+="/NthPrime"
COMPRESSED_FILE+=/NthPrime.tgz

cd $(dirname "$(realpath "$0")")
tar zxf "$COMPRESSED_FILE"
cd "$FOLDER"
gcc main.c nth_prime.c -o program.exe
./program.exe "$1"
cd ..
rm -rf $FOLDER
cd "$WORKING_DIRECTORY"

