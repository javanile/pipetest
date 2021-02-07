#!/usr/bin/env bash
set -e

source ./pipetest.sh

export PIPETEST_NAME="Check if file exists"
assert_file_exists test/fixtures/sample_file.txt
#| assert_equals "single line string"
