#!/bin/bash

# Change to the script's directory
cd "$(dirname "$0")" || exit 1

MODEL_DEST="/root/.yawcam-ai/models/"
LIB_DEST="/root/.yawcam-ai/libs/"

echo "Preparing Yawcam Ai files..."

# Ensure necessary directories exist
mkdir -p "$MODEL_DEST"
mkdir -p "$LIB_DEST"

# Copy models and libs to their respective directories, update only if newer
cp -urv /files/models/* "$MODEL_DEST"
cp -urv /files/libs/* "$LIB_DEST"

echo "File preparation complete."
echo

exit 0
