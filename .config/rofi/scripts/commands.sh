#!/bin/bash

commands_file="$HOME/.config/rofi/scripts/commands.txt"

# Проверяем существование файла
if [ ! -f "$commands_file" ]; then
    echo "Файл команд не найден!"
    exit 1
fi

# Если есть аргумент (выбрана команда)
if [ -n "$1" ]; then
    # Получаем команду до ::
    command=$(echo "$1" | sed 's/ ::.*$//')
    # Копируем в буфер обмена
    if command -v xclip >/dev/null 2>&1; then
        echo -n "$command" | xclip -selection clipboard
        # Используем zenity вместо notify-send
        zenity --notification --text="Команда скопирована: $command" &
        pkill rofi
    else
        echo "xclip не установлен"
        exit 1
    fi
    exit 0
fi

# Выводим команды с форматированием
grep -v '^#' "$commands_file" | grep -v '^[[:space:]]*$' | while read -r line; do
    if [[ $line == *"::"* ]]; then
        command="${line%%::*}"
        description="${line##*::}"
        printf "%s\n" "${command}::${description}"
    fi
done
