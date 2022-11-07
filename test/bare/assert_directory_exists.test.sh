#!/usr/bin/env bash
set -e

source ./pipetest.sh

no_data="No input data was detected"

echo "" | assert_directory_exists | assert_equals "${no_data}"
bash test/fixtures/empty.sh | assert_directory_exists | assert_equals "${no_data}"
echo -e " \n \t \r \t \n \r" | assert_directory_exists | assert_equals "${no_data}"
echo dir | assert_directory_exists | assert_equals "Directory 'dir' does not exists."

## Assert positive
#echo test/fixtures | assert_directory_exists
