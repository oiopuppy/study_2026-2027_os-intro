#!/bin/bash

input_file=""
output_file=""
pattern=""
case_sensitive=""   
show_line_numbers="" 

while getopts "i:o:p:Cn" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        p) pattern="$OPTARG" ;;
        C) case_sensitive="-C" ;; 
        n) show_line_numbers="-n" ;;
        *) echo "использование: $0 -i <inputfile> -o <outputfile> -p <pattern> [-C] [-n]"
           exit 1 ;;
    esac
done

if [[ -z "$input_file" ]] || [[ -z "$pattern" ]]; then
    echo "Ошибка: необходимо указать -i (входной файл) и -p (режим)."
    echo "использование: $0 -i <inputfile> -o <outputfile> -p <pattern> [-C] [-n]"
    exit 1
fi

if [[ ! -f "$input_file" ]]; then
    echo "Ошибка: Входной файл '$input_file' не существует."
    exit 1
fi

grep_opts=""
if [[ -n "$case_sensitive" ]]; then
    grep_opts=""
else
    grep_opts="-i"  
fi

if [[ -n "$show_line_numbers" ]]; then
    grep_opts="$grep_opts -n"
fi

if [[ -n "$output_file" ]]; then
    grep $grep_opts "$pattern" "$input_file" > "$output_file"
    echo "Результаты опубликованы $output_file"
else
    grep $grep_opts "$pattern" "$input_file"
fi
