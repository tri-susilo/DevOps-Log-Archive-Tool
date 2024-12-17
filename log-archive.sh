#!/bin/bash

# Predefined folder where the archive will be saved
ARCHIVE_SAVE_DIR="/path/to/archive_folder"

# Check if the argument for the directory is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/log_directory"
    exit 1
fi

# Set variables
LOG_DIR=$1
ARCHIVE_NAME="logs_$(date +%Y%m%d_%H%M%S).tar.gz"
ARCHIVE_PATH="${ARCHIVE_SAVE_DIR}/${ARCHIVE_NAME}"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Check if the archive save directory exists, create it if not
if [ ! -d "$ARCHIVE_SAVE_DIR" ]; then
    echo "Archive folder '$ARCHIVE_SAVE_DIR' does not exist. Creating it..."
    mkdir -p "$ARCHIVE_SAVE_DIR"
fi

# Create the tar.gz archive
echo "Archiving logs from '$LOG_DIR' to '$ARCHIVE_PATH'..."
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# Check if the archive was successful
if [ $? -eq 0 ]; then
    echo "Archive created successfully: $ARCHIVE_PATH"
else
    echo "Error occurred while archiving logs."
    exit 1
fi
