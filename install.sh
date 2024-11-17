#!/bin/bash

# Установка необходимых пакетов
if command -v dnf &> /dev/null; then
    # Fedora
    sudo dnf install -y rofi xclip zenity
else
    echo "Этот скрипт предназначен для Fedora Linux"
    exit 1
fi

# Создание конфигурационных директорий
mkdir -p ~/.config/rofi/scripts

# Копирование конфигурационных файлов
cp configs/rofi/config.rasi ~/.config/rofi/
cp configs/rofi/theme.rasi ~/.config/rofi/
cp configs/rofi/command-theme.rasi ~/.config/rofi/
cp configs/rofi/scripts/commands.sh ~/.config/rofi/scripts/
cp configs/rofi/scripts/commands.txt ~/.config/rofi/scripts/

# Установка прав на выполнение для скрипта
chmod +x ~/.config/rofi/scripts/commands.sh

echo "Установка завершена! Перезапустите систему для применения изменений."
