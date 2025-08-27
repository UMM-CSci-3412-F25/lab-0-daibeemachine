#!/usr/bin/env bash

WORKING_DIRECTORY=$(pwd)
COMPRESSED_FILE=$(dirname "$(realpath "$0")")
FOLDER="$COMPRESSED_FILE"
FOLDER+="/NthPrime"
COMPRESSED_FILE+=/NthPrime.tgz

echo $(dirname "$(realpath "$0")")

cd $(dirname "$(realpath "$0")")
tar zxf "$COMPRESSED_FILE"
ls
rm -rf $FOLDER
cd "$WORKING_DIRECTORY"

