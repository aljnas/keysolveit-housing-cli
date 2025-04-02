#!/bin/bash
# KeySolveIT Game Backup Script

KEY_PATH=~/Desktop/Web_Key_Solve.pem
REMOTE_USER=ubuntu
REMOTE_HOST=54.226.109.140
REMOTE_DIR=/var/www/html/game
LOCAL_BACKUP_DIR=~/Desktop/keysolveit_backup

mkdir -p $LOCAL_BACKUP_DIR

echo "[+] Descargando archivos desde el servidor..."
scp -i $KEY_PATH $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/* $LOCAL_BACKUP_DIR/

echo "[✓] Backup completado en $LOCAL_BACKUP_DIR"
