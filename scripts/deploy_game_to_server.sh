#!/bin/bash
# KeySolveIT Game Deploy Script

KEY_PATH=~/Desktop/Web_Key_Solve.pem
REMOTE_USER=ubuntu
REMOTE_HOST=54.226.109.140
LOCAL_DIR=~/Desktop
FILES="dashboard.html index.html mission1.html mission2.html mission3.html logo.png"

echo "[+] Subiendo archivos al servidor..."
scp -i $KEY_PATH $FILES $REMOTE_USER@$REMOTE_HOST:~

echo "[+] Moviendo archivos a /var/www/html/game/ y reiniciando Apache..."
ssh -i $KEY_PATH $REMOTE_USER@$REMOTE_HOST << 'EOF'
  sudo mv ~/dashboard.html ~/index.html ~/mission1.html ~/mission2.html ~/mission3.html ~/logo.png /var/www/html/game/
  sudo systemctl restart apache2
EOF

echo "[✓] Despliegue completado: https://keysolveit.com/game"
