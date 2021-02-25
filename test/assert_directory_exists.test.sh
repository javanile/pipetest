#!/usr/bin/env bash
set -e

source ./pipetest.sh

echo test/fixtures | assert_directory_exists
