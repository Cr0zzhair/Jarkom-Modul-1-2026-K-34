#!/bin/bash
echo "=== Auto Setup Users & Passwords ==="

# Membuat user (pesan error diabaikan jika user sudah ada)
useradd -m -s /bin/bash alice 2>/dev/null
useradd -m -s /bin/bash mika 2>/dev/null
useradd -m -s /bin/bash eiri 2>/dev/null

# Memaksa reset password menjadi '123'
echo "alice:123" | chpasswd
echo "mika:123" | chpasswd
echo "eiri:123" | chpasswd

# Memastikan hak akses folder
mkdir -p /var/wired/data
chown alice:root /var/wired/data
chmod 755 /var/wired/data