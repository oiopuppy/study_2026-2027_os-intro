#!/bin/bash

t1=${1:-10}
t2=${2:-3}
lockfile=${3:-/tmp/my_resource.lock}

echo "Процесс $$ запущен. t1=$t1 t2=$t2 lock=$lockfile"
echo "Вывод направлен на терминал `tty`"

waited=0
while [ $waited -lt $t1 ]; do
    if mkdir "$lockfile" 2>/dev/null; then
        echo "Процесс $$ получил ресурс (ожидал $waited сек.)"
        # Использование ресурса t2 секунд
        sleep $t2
        echo "Процесс $$ освобождает ресурс"
        rmdir "$lockfile"
        exit 0
    fi
    echo "Процесс $$ ожидает освобождения ресурса... ($waited/$t1)"
    sleep 1
    waited=$((waited+1))
done

echo "Процесс $$ не дождался ресурса за $t1 сек."
exit 1
