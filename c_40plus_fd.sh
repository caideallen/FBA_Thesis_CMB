#!/bin/bash

# Input text file containing IDs (one ID per line)
ID_FILE="40plus.txt"

# Source and destination directories
SRC_DIR="fd_smooth"
DEST_DIR="40plus/fd_smooth"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Read each ID from the text file
while IFS= read -r ID; do
    # Skip empty lines
    [[ -z "$ID" ]] && continue

    SRC_FILE="${SRC_DIR}/${ID}.mif"
    DEST_FILE="${DEST_DIR}/${ID}.mif"

    # Copy if source file exists
    if [[ -f "$SRC_FILE" ]]; then
        cp "$SRC_FILE" "$DEST_FILE"
        echo "Copied: $SRC_FILE -> $DEST_FILE"
    else
        echo "Missing file: $SRC_FILE"
    fi
done < "$ID_FILE"
