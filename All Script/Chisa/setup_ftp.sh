#!/bin/bash

echo "1. Memulai instalasi vsftpd..."
apt update
apt install vsftpd -y

echo "2. Membuat direktori /var/wired/data..."
mkdir -p /var/wired/data

echo "3. Membuat user Alice, Mika, Eiri dengan password '123'..."
useradd -m -s /bin/bash alice 2>/dev/null
echo "alice:123" | chpasswd

useradd -m -s /bin/bash mika 2>/dev/null
echo "mika:123" | chpasswd

useradd -m -s /bin/bash eiri 2>/dev/null
echo "eiri:123" | chpasswd

echo "4. Mengatur hak akses & membuat file dummy Alice..."
chown alice:root /var/wired/data
chmod 755 /var/wired/data

echo "Pesan dari Alice untuk dibaca" > /var/wired/data/signal_alice.txt
chown alice:alice /var/wired/data/signal_alice.txt
chmod 755 /var/wired/data/signal_alice.txt

echo "5. Menulis file konfigurasi vsftpd.conf..."
cat <<EOF > /etc/vsftpd.conf
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_root=/var/wired/data
userlist_enable=YES
userlist_deny=YES
userlist_file=/etc/vsftpd.userlist
EOF

echo "6. Menerapkan blacklist untuk Eiri..."
echo "eiri" > /etc/vsftpd.userlist

echo "7. Menjalankan layanan FTP..."
/usr/sbin/vsftpd /etc/vsftpd.conf &

echo "=== Konfigurasi FTP Selesai! ==="