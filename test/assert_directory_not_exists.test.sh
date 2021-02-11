#!/usr/bin/env bash

source ./test/testcase.sh

echo ${conf_file} | assert_file_exists
