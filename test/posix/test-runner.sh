#!/usr/bin/env bash
set -e

#busybox:1.32.1
#alpine

test=${PWD}/test/posix/posix-test.sh:/posix-test.sh

docker run --rm -v ${test} williamyeh/dash /bin/sh /posix-test.sh


