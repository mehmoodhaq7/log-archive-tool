#!/bin/bash

# Log Archive Tool

# check if directory is given
if [ -z "$1" ];
then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="archives"
mkdir -p $ARCHIVE_DIR  

ARCHIVE_NAME="$ARCHIVE_DIR/logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -czf $ARCHIVE_NAME -C $LOG_DIR .
echo "Logs archived into: $ARCHIVE_NAME"

# --- Auto-cleanup: keep only last 5 archives ---
MAX_FILES=5
ARCHIVES_COUNT=$(ls -1 $ARCHIVE_DIR/*.tar.gz 2>/dev/null | wc -l)

if [ $ARCHIVES_COUNT -gt $MAX_FILES ]; then
  ls -1t $ARCHIVE_DIR/*.tar.gz | tail -n +$((MAX_FILES+1)) | xargs rm -f
  echo "Old archives cleaned up. Kept only latest $MAX_FILES files."
fi
