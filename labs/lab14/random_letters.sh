#!/bin/bash

length=${1:-20}

echo -n "Случайная последовательность: "
for ((i=0; i<length; i++)); do
    # $RANDOM выдаёт 0..32767, берём по модулю 26 и прибавляем код 'a'
    printf "\\$(printf '%03o' $(( 97 + RANDOM % 26 )))"
done
echo
