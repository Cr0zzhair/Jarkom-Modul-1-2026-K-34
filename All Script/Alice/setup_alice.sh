#!/bin/bash
echo "1. Menginstal FTP Client..."
apt update
apt install ftp -y

echo "2. Membuat file pengujian Alice..."
echo "Ini adalah pesan bukti dari Alice." > /root/signal_alice.txt

echo "=== Setup Alice Selesai! ==="