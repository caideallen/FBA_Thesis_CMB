#!/bin/bash

ID_FILE="40plus.txt"
SRC_DIR="fd_smooth"
DEST_DIR="40plus/fd_smooth"

mkdir -p "$DEST_DIR"

while read -r ID; do
    # remove carriage returns/spaces
    ID=$(echo "$ID" | tr -d '\r' | xargs)

    # skip empty lines
    [[ -z "$ID" ]] && continue

    SRC_FILE="${SRC_DIR}/${ID}.mif"

    echo "Looking for: $SRC_FILE"

    if [[ -f "$SRC_FILE" ]]; then
        cp "$SRC_FILE" "$DEST_DIR/"
        echo "Copied $ID.mif"
    else
        echo "Missing: $SRC_FILE"
    fi

done < "$ID_FILE"
