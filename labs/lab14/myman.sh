#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 команда"
    exit 1
fi

manpage="/usr/share/man/man1/${1}.1.gz"

if [ -f "$manpage" ]; then
    zless "$manpage"
else
    echo "Справка по '$1' не найдена в /usr/share/man/man1"
    exit 1
fi
