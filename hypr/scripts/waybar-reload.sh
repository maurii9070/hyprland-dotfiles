#!/usr/bin/env bash
# ~/.local/bin/waybar-reload
# Mata cualquier instancia de waybar y la vuelve a lanzar

pkill -x waybar
sleep 0.2                    # pequeña pausa para que muera del todo
GDK_BACKEND=wayland waybar &  # arranca de nuevo en background
