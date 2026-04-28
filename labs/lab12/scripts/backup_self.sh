#!/bin/bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_NAME=$(basename "$SCRIPT_PATH")

BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

BACKUP_FILE="${BACKUP_DIR}/${SCRIPT_NAME}_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname "$SCRIPT_PATH")" "$SCRIPT_NAME"

if [ $? -eq 0 ]; then
    echo "yes：$BACKUP_FILE"
else
    echo "no"
fi
