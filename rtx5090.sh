#!/bin/bash

set -e

DOWNLOAD_DIR="/home/bizon/Downloads"
REPO_URL="https://github.com/wilicc/gpu-burn.git"
REPO_NAME="gpu-burn"

echo "Navigating to $DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

if [ -d "$REPO_NAME" ]; then
  echo "Removing existing $REPO_NAME folder..."
  rm -rf "$REPO_NAME"
fi

echo "Cloning GPU Burn repo..."
git clone "$REPO_URL"

cd "$REPO_NAME"
echo "Compiling..."
sudo make

echo "Running GPU Burn with thermal check..."
./gpu_burn -tc 90000
