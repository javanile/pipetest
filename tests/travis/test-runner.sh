#!/usr/bin/env bash
set -e

if command -v apk &> /dev/null; then
  apk --quiet add make
elif command -v apt &> /dev/null; then
  apt-get update &> /dev/null
  apt-get install make &> /dev/null
fi

SHELL=$(basename ${DOCKER_SHELL} | cut -d':' -f1)

echo "========================================"
${SHELL} --version
echo "========================================"
echo ""

${SHELL} -c "make test"
