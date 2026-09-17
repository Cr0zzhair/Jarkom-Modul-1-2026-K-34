#!/bin/bash

echo "[1] Installing SSH and Nginx..."
apt update
apt install -y openssh-server nginx

echo "[2] Starting SSH..."
service ssh start

echo "[3] Starting Nginx..."
service nginx start

echo "[4] Checking ports..."
ss -lntp | grep -E ':22|:80|:7777'

echo ""
echo "========================================"
echo " Port configuration complete"
echo " SSH  : 22   OPEN"
echo " HTTP : 80   OPEN"
echo " 7777 :      CLOSED"
echo "========================================"