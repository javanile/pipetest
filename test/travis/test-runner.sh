#!/usr/bin/env bash
set -e

if command -v apk &> /dev/null; then
  apk add make
fi

echo "========================================"
bash --version
echo "========================================"

make test-bats
