#!/usr/bin/env bash
set -e

source pipetest.sh

pipetest "Empty stdout"
bash test/fixtures/empty.sh | assert_equals "Hello World!"

pipetest "Empty string input"
echo "" | assert_equals ""

pipetest "Simple string"
echo "Hello World!" | assert_equals "Hello World!"

pipetest "Simple multi-line string"
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

pipetest "Default fail message on equals"
echo "A" | assert_equals "B" | assert_equals "Asserting error: expected \"B\" actual \"A\" in test/assert_equals.test.sh:22"

pipetest "Default success message on equals"
echo "A" | assert_equals "A" | assert_equals "Exact match over 1 line"

pipetest "Custom fail message on equals"
echo "A" | assert_equals "B" "FAIL" | assert_equals "FAIL in test/assert_equals.test.sh:28"

pipetest "Custom success message on equals"
echo "A" | assert_equals "A" "FAIL" "SUCCESS" | assert_equals "SUCCESS"
