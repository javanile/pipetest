#!/usr/bin/env bash
set -e

trap 'fail' ERR

source ./pipetest.sh

test "Empty stdout"
expected="Asserting error: expected \"Hello World!\" actual is empty in test/assert_equals.test.sh:8"
bash test/fixtures/empty.sh | assert_equals "Hello World!" # | assert_equals "${expected}"

exit

test "Empty string"
echo "" | assert_equals ""

test "Simple string"
echo "Hello World!" | assert_equals "Hello World!"

test "Simple multi-line string"
echo -e "Hello\nWorld" | assert_equals "$(cat << EOF
Hello
World
EOF
)"
( echo "Hello"; echo "World" ) | assert_equals "$(cat << EOF
Hello
World
EOF
)"

test "Default fail message on equals"
echo "A" | assert_equals "B" | assert_equals "Asserting error: expected \"B\" actual \"A\" in test/assert_equals.test.sh:22"

test "Default success message on equals"
echo "A" | assert_equals "A" | assert_equals "Exact match over 1 line"

test "Custom fail message on equals"
echo "A" | assert_equals "B" "FAIL" | assert_equals "FAIL in test/assert_equals.test.sh:28"

test "Custom success message on equals"
echo "A" | assert_equals "A" "FAIL" "SUCCESS" | assert_equals "SUCCESS"
