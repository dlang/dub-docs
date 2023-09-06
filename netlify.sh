#!/usr/bin/env bash
# A small script to build the registry and download a few pages for a static build

set -euo pipefail
set -x

DMD_VERSION="2.105.0"
BUILD_DIR="out"

CURL_FLAGS=(-fsSL --retry 10 --retry-delay 30 --retry-max-time 600 --connect-timeout 5 --speed-time 30 --speed-limit 1024)

. "$(curl "${CURL_FLAGS[@]}" https://dlang.org/install.sh | bash -s install "dmd-${DMD_VERSION}" --activate)"

./regenerate-cli-docs.sh

pip3 install -r requirements.txt
mkdocs build -d "$BUILD_DIR"
