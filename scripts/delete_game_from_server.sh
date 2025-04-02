#!/bin/bash
# KeySolveIT Game Deletion Script

KEY_PATH=~/Desktop/Web_Key_Solve.pem
REMOTE_USER=ubuntu
REMOTE_HOST=54.226.109.140
REMOTE_DIR=/var/www/html/game

echo "[!] Esto eliminará TODOS los archivos del juego en el servidor en: $REMOTE_DIR"
read -p "¿Estás seguro? (s/N): " confirm

if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
  ssh -i $KEY_PATH $REMOTE_USER@$REMOTE_HOST << EOF
    sudo rm -rf $REMOTE_DIR/*
    sudo systemctl restart apache2
EOF
  echo "[✓] Juego eliminado del servidor."
else
  echo "[X] Cancelado. No se eliminó nada."
fi
