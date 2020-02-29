#!/usr/bin/env bash

##
# Pipetest
#
# The best testing framework around BASH projects.
#
# Copyright (c) 2020 Francesco Bianco <bianco@javanile.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
##

[[ -z "${LCOV_DEBUG}" ]] || set -x

VERSION="0.1.0"

## Prevent direct file access
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    echo "[ERROR] Pipetest MUST be sourced!"
    echo " >>> Use 'source pipetest.sh' into your BASH script."
    exit 1
fi

##
#
##
assert_directory_exists () {
    if [[ ! -d "$1" ]]; then
        echo "Directory '$1' does not exists."
        pipetest_exit
    fi
    echo ""
}

##
#
##
assert_file_exists () {
    if [[ ! -f "$1" ]]; then
        echo "File '$1' does not exists."
        pipetest_exit
    fi
}

##
#
##
assert_equals () {
    row=0
    expect=("$@")
    while read actual; do
        echo "DIFF(${row}): ${actual} <-> ${expect[${row}]}"
        if [[ "${actual}" != "${expect[${row}]}" ]]; then
            echo "Expected '${expect[${row}]}' found '${actual}'"
            pipetest_exit
        fi
        row=$((row+1))
    done
    echo "Assert output equals success"
}

##
#
##
pipetest_name () {
    if [[ ! -z "${PIPETEST_NAME}" ]]; then
        echo "---> ${PIPETEST_NAME}"
        PIPETEST_NAME=
    fi
}

##
#
##
pipetest_exit () {
    exit 1
}
