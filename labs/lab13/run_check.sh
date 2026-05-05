#!/bin/bash

./check_number
exit_code=$?

case $exit_code in
    0) echo "Введенное вами число равно 0." ;;
    1) echo "Введенное вами число больше 0." ;;
    2) echo "Введенное вами число меньше 0." ;;
    *) echo "Программа завершилась с ошибкой. (code $exit_code)" ;;
esac
