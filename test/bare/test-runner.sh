#!/usr/bin/env bash
set -e

echo "====[ Docs analysis ]===="
grep -E '^- \[\*\*assert_[a-z_]+\*\*\]' README.md | while read -r function_link; do
  echo "==> ${function_link}"
done

exit

echo "====[ Run all tests ]===="
grep -E '^assert_[a-z_]+' pipetest.sh | sed 's/[\(\)\{ ]//g' | while read -r function; do
  printf "==> %-25s" "${function}: "
  test_result=$(bash "test/bare/${function}.test.sh" 2>&1 || true)
  if [[ "${test_result}" =~ "Test successfully" ]]; then
    echo "OK"
  else
    echo "Fail"
  fi
done

