#!/usr/bin/env bash

#The WORKING_DIRECTORY variable stores the working directory of the user
#before running this program.
#The FILE_NAME variable stores the final name for the cleaned tgz file.
#The FILE_NAME_ONLY variable stores the name for the directory created
#when unzipping the given tgz file.
#The SCRATCH variable stores the path for the temporary directory
# created.
WORKING_DIRECTORY="$(pwd)"
FILE_NAME="cleaned_"
FILE_NAME+="$(basename "$(realpath "$1")")"
FILE_NAME_ONLY="$(basename "$(realpath "$1")" .tgz)"
SCRATCH="$(mktemp --directory)"

#Extracts the directory given in a temporary directory.
tar zxf "$1" --directory "$SCRATCH"
#Finds and deletes each .txt file with the string "DELETE ME!" in the
#given directory.
grep -lr "DELETE ME!" "$SCRATCH" | xargs rm
#Changes the working directory to the temporary directory.
cd "$SCRATCH" || exit
#Compresses the temporary directory into a tar file named from the
#variable FILE_NAME (see above).
tar -czf "$FILE_NAME" "$FILE_NAME_ONLY"
#Moves the newly created tgz file into the user's working directory
#before this program ran.
mv "$FILE_NAME" "$WORKING_DIRECTORY"
#Navigates back to the working directory the user had prior to running
#this program.
cd "$WORKING_DIRECTORY" || exit
