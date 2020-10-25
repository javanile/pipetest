#!/usr/bin/env bash

source pipetest.sh

echo "ciao" | assert_equals "ciao"

