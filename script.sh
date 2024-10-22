#!/bin/bash

target_dir="."


script_name=$(basename "$0")


for item in "$target_dir"/*; do
    # пропустити сам скрипт
    if [ "$(basename "$item")" == "$script_name" ]; then
        continue
    fi

    # перевірка чи це є директорія
    if [ -d "$item" ]; then
        echo "$(basename "$item") є директорією"

    # якщо це файл
    elif [ -f "$item" ]; then
        filename=$(basename "$item")
        # створиться нова директорія з іменем файлу + "_dir"
        new_dir="${filename}_dir"
        mkdir "$new_dir"
     
        mv "$item" "$new_dir/"
        echo "$filename переміщений у $new_dir"
    fi
done