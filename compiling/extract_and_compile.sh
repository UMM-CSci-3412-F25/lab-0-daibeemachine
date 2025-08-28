#!/usr/bin/env bash

#These variables find the location of this file's parent folder's
#NthPrime.tgz (FOLDER) and its extracted contents (COMPRESSED_FILE).
#WORKING_DIRECTORY stores the user's working directory.
WORKING_DIRECTORY=$(pwd)
COMPRESSED_FILE=$(dirname "$(realpath "$0")")
FOLDER="$COMPRESSED_FILE"
FOLDER+="/NthPrime"
COMPRESSED_FILE+=/NthPrime.tgz

#These lines of code switch to the directory with extract_and_compile.sh,
#extract NthPrime.tgz and compile its c source files into an executable,
#and runs said executable with the parameter ($1) given. Then, the
#program deletes the NthPrime folder and navigates back to the user's
#original working directory before running this shellscript.
cd "$(dirname "$(realpath "$0")")" || exit
tar zxf "$COMPRESSED_FILE"
cd "$FOLDER" || exit
gcc main.c nth_prime.c -o NthPrime
./NthPrime "$1"
cd ..
cd "$WORKING_DIRECTORY" || exit

