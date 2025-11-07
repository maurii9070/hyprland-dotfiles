#!/bin/bash

# Directorio donde guardas tus wallpapers
WALLPAPER_DIR="$HOME/Imagenes/wallpapers"

# 1. Listar los archivos, filtrando por formatos comunes y preparando para Wofi
#    Esto crea una lista con solo los nombres de los archivos.
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sed "s|$WALLPAPER_DIR/||")

# 2. Usar Wofi para mostrar la lista y obtener la selección del usuario
SELECTION=$(echo -e "$WALLPAPERS" | wofi --show dmenu --prompt "Seleccionar Wallpaper:" )

# 3. Si se selecciona algo, aplicar el wallpaper con swww
if [ -n "$SELECTION" ]; then
    # Ruta completa del wallpaper seleccionado
    FULL_PATH="$WALLPAPER_DIR/$SELECTION"
    
    # Comando de swww para aplicar el fondo con una transición (ej. "grow")
    swww img "$FULL_PATH" --transition-type grow --transition-duration 1.5 --transition-fps 60
fi