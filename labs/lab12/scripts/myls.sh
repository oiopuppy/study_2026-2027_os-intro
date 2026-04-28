#!/bin/bash

TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: '$TARGET_DIR' is not a directory"
    exit 1
fi

echo "Table of contents：$TARGET_DIR"

for item in "$TARGET_DIR"/*; do
    if [ -e "$item" ]; then
        perm=$(stat -c "%A" "$item")
        name=$(basename "$item")
        printf "%-10s %s\n" "$perm" "$name"
    fi
done
