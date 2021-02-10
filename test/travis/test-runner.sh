#!/usr/bin/env bash
set -e

if command -v apk &> /dev/null; then
  apk --quiet add make
fi

echo "========================================"
${SHELL} --version
echo "========================================"

make test
