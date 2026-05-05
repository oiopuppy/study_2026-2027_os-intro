#include <stdio.h>
#include <stdlib.h>

int main() {
    int num;
    printf("Пожалуйста, введите целое число.: ");
    if (scanf("%d", &num) != 1) {
        fprintf(stderr, "Ошибка ввода, должно быть целое число.\n");
        return 3; 
    }
    if (num > 0) {
        exit(1);
    } else if (num < 0) {
        exit(2);
    } else {
        exit(0);
    }
}

