#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь к каталогу>"
    exit 1
fi

target_dir="$1"

if [ ! -d "$target_dir" ]; then
    echo "Ошибка: Каталог '$target_dir' не существует."
    exit 1
fi

cd "$target_dir" || exit 1
tar -cf "$OLDPWD/backup_all.tar" .
echo "Все файлы упакованы в $OLDPWD/backup_all.tar"
cd "$OLDPWD"
