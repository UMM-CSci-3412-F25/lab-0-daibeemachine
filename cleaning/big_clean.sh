#!/usr/bin/env bash

SCRATCH=$(mktemp --directory)

tar zxf "$1" --directory "$SCRATCH"
ls $SCRATCH

rm -rf "$SCRATCH"
