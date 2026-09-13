#!/bin/bash
set -e

# Bersihkan lock file jika container pernah crash sebelumnya
rm -f /tmp/.X99-lock

# Jalankan virtual display
Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

sleep 2

# Jalankan VNC server tanpa password
x11vnc -display :99 -forever -nopw -quiet -listen 0.0.0.0 -xkb &

echo "Display virtual & VNC siap. Menjalankan proses utama..."
exec /app/check-permissions.sh "$@"