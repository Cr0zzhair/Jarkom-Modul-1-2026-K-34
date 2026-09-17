#!/bin/bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo " === VERIFIKASI STATUS JARINGAN ROUTER === "

echo -e "\n[+] 1. Ringkasan Interface (ip -br a):"
echo "----------------------------------------------------"
ip -br a

echo -e "\n[+] 2. Status Tabel NAT (iptables -t nat -L -v -n):"
echo "----------------------------------------------------"
iptables -t nat -L -v -n

echo " === SELESAI === "