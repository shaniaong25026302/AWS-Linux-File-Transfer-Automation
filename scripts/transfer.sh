#!/bin/bash

SOURCE="$HOME/files-to-transfer/"
DEST="ubuntu@172.31.10.130:/home/ubuntu/received-files/"
KEY="$HOME/.ssh/file-transfer-internal"
LOG="$HOME/logs/transfer.log"

echo "[$(date)] Starting file transfer" >> "$LOG"

if rsync -av -e "ssh -i $KEY -o BatchMode=yes" "$SOURCE" "$DEST" >> "$LOG" 2>&1; then
    echo "[$(date)] Transfer successful" | tee -a "$LOG"
else
    echo "[$(date)] Transfer failed" | tee -a "$LOG"
    exit 1
fi