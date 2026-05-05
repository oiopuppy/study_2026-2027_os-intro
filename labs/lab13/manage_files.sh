#!/bin/bash

usage() {
    echo "использование: $0 {create|delete} <числоN>"
    echo "  create N  Создать файл 1.tmp и преобразовать его в файл N.tmp."
    echo "  delete N  Удалите файлы с 1.tmp до N.tmp (если они существуют)"
    exit 1
}

if [ $# -ne 2 ]; then
    usage
fi

action=$1
N=$2
if ! [[ "$N" =~ ^[0-9]+$ ]] || [ "$N" -eq 0 ]; then
    echo "Ошибка: N должно быть положительным целым числом."
    usage
fi

case $action in
    create)
        for i in $(seq 1 $N); do
            touch "${i}.tmp"
            echo "Созданный ${i}.tmp"
        done
        ;;
    delete)
        for i in $(seq 1 $N); do
            if [ -f "${i}.tmp" ]; then
                rm "${i}.tmp"
                echo "Удалено ${i}.tmp"
            else
                echo "${i}.tmp Не существует, пропустить."
            fi
        done
        ;;
    *)
        echo "Ошибка: Первый аргумент должен быть либо create, либо delete."
        usage
        ;;
esac
