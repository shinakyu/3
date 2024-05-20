#!/bin/bash

read -p "Введите старое слово: " old
read -p "Введите новое слово: " new

current_directory=$(pwd)

touch sp.txt

for file in "$current_directory"/*.txt; do
    if grep -q "$old" "$file"; then
        sed -i "s/$old/$new/g" "$file"
        echo "$file" >> sp.txt
    fi
done

printf "Список файлов в sp.txt\n"

