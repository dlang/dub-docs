#!/usr/bin/env bash
# A small script to build the registry and download a few pages for a static build

set -euo pipefail
set -x

BUILD_DIR="out"

pip3 install -r requirements.txt
mkdocs build -d "$BUILD_DIR"
