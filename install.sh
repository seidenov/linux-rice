#!/bin/bash

# Установка необходимых пакетов
sudo dnf install rofi

# Создание конфигурационных директорий
mkdir -p ~/.config/rofi

# Копирование конфигурационных файлов
cp configs/rofi/config.rasi ~/.config/rofi/
cp configs/rofi/theme.rasi ~/.config/rofi/
