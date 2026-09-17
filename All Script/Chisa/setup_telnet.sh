#!/bin/bash

echo "[1] Update repository..."
apt update

echo "[2] Install Telnet server..."
apt install -y openbsd-inetd telnetd

echo "[3] Aktifkan Telnet di inetd..."
sed -i 's/^#<off># //' /etc/inetd.conf

echo "[4] Restart inetd..."
service openbsd-inetd restart

echo "[5] Buat user phantom_user..."
if ! id phantom_user >/dev/null 2>&1; then
    useradd -m -s /bin/bash phantom_user
fi

echo "[6] Set password..."
echo "phantom_user:wired_ghost" | chpasswd

echo "[7] Cek port Telnet..."
ss -lntp | grep ':23'