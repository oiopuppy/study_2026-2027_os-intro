#!/bin/bash
backup_dir="/tmp/backup/$(date +%Y%m%d)"
mkdir -p "$backup_dir"

echo "test" > test1.log
echo "test" > test2.log

for file in *.log; do
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/"
        echo "Скопирован: $file"
    fi
done

echo "Резервное копирование завершено в $backup_dir"
