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

find . -type f -mtime -7 -print0 > /tmp/files.list

if [ ! -s /tmp/files.list ]; then
    echo "Резервные копии не будут созданы, если за последние 7 дней не было изменений в файлах."
    rm -f /tmp/files.list
    cd "$OLDPWD"
    exit 0
fi

tar -cf "$OLDPWD/backup_recent.tar" --null -T /tmp/files.list
echo "Файлы, измененные за последние 7 дней, были упакованы в $OLDPWD/backup_recent.tar"
rm -f /tmp/files.list
cd "$OLDPWD"
