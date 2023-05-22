#!/usr/bin/env bash
set -e

grep -E '^assert_[a-z_]+' pipetest.sh | sed 's/[\(\)\{ ]//g' | while read -r function; do
  printf "==> %-25s" "${function}: "
  test_result=$(bash "test/bare/${function}.test.sh" 2>&1 || true)
  if [[ "${test_result}" =~ "Test successfully" ]]; then
    echo "OK"
  else
    echo "Fail"
  fi
done
