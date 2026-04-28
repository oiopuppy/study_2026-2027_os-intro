#!/bin/bash

echo "A total of $# parameters were received："
count=1
for arg in "$@"; do
    echo "parameter $count : $arg"
    ((count++))
done
