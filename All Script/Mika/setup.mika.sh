#!/bin/bash
echo "1. Menginstal FTP Client..."
apt update
apt install ftp -y

echo "2. Membuat file pengujian Mika..."
echo "Ini file milik Mika" > /root/file_mika.txt

echo "=== Setup Mika Selesai! ==="