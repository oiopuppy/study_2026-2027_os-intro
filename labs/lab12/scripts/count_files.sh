#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <extension> <directory>"
    echo "Example: $0 .txt /home/hhl"
    exit 1
fi

EXT="$1"
DIR="$2"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

if [[ "$EXT" != .* ]]; then
    EXT=".$EXT"
fi

count=$(find "$DIR" -maxdepth 1 -type f -name "*$EXT" | wc -l)

echo "In the directory '$DIR', there are a total of $count files with the extension '$EXT'."
