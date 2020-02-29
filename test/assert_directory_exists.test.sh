#!/usr/bin/env bash

source ./test/testcase.sh

echo "single line string" | assert_equals "single line string"
