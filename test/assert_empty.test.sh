#!/usr/bin/env bash
set -e

source ./pipetest.sh

#echo "==> Script with empty stdout"
#bash test/fixtures/empty.sh | assert_empty | assert_equals "Found empty value as expected"

#echo "==> Script with empty stdout (custom message)"
#bash test/fixtures/empty.sh | assert_empty "CUSTOM" | assert_equals "CUSTOM"

echo "==> Empty string input"
echo "" | assert_empty

#echo "==> Empty string input (custom message)"
#echo "" | assert_empty "CUSTOM"

echo "==> Mixed blank lines"
cat test/fixtures/file-with-blank-lines.txt | assert_empty
