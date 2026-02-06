#!/bin/bash

SERVICE=hytale
SERVER_DIR="/opt/hytale-server"
BACKUP_DIR="/opt/backups/hytale"
DATE=$(date +"%Y-%m-%d_%H-%M")

mkdir -p "$BACKUP_DIR"

echo "[1/4] Stopping server..."
systemctl stop $SERVICE

echo "[2/4] Creating backup..."
tar -czf "$BACKUP_DIR/hytale-$DATE.tar.gz" "$SERVER_DIR"

echo "[3/4] Starting server..."
systemctl start $SERVICE

echo "[4/4] Backup completed"
