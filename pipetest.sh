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
PIPETEST_STDIN=
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    PIPETEST_STDIN=true
fi

##
# Assert if directory exists
#
# Arguments
#  - $1: Directory name
# Output
#  - if directory not exists print an error message
#  - else newline
##
assert_directory_exists() {
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
    local row=0
    declare -a expect
    while read -r line; do
      expect[${row}]="$line"
      row=$((row+1))
    done
    row=0
    while read actual; do
        #echo "DIFF(${row}): ${actual} <-> ${expect[${row}]}"
        if [[ "${actual}" != "${expect[${row}]}" ]]; then
            if [[ -z "$2" ]]; then
                echo -n "Asserting error: expected \"${expect[${row}]}\" actual \"${actual}\" "
            else
                echo -n "$2 "
            fi
            [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
            pipetest_exit
        fi
        row=$((row+1))
    done
    if [[ "${row}" = "0" ]]; then
        if [[ -z "$2" ]]; then
            echo -n "Asserting error: expected \"$1\" actual is empty "
        else
            echo -n "$2 "
        fi
        [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
        pipetest_exit
    fi
    [[ -z "$3" ]] && echo "Exact match over ${row} line" || echo $3
}

##
#
##
pipetest () {
    echo "---> $1"
}

##
#
##
pipetest_exit () {
    exit 1
}

##
# If input is provided by STDIN
##
if [[ ! -z "${PIPETEST_STDIN}" ]]; then
    if [[ -z "${1}" ]]; then
        echo "Use one of the Pipetest assert directive as first argument (eg. pipetest assert_equals)"
        exit 1
    elif [[ "${1}" = "--version" ]]; then
        echo "Pipetest ${VERSION} (${0})"
        exit 0
    fi
    "${1}" "${@:2}"
fi
