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

set -e

[[ -z "${LCOV_DEBUG}" ]] || set -x

VERSION="0.1.0"
PIPETEST_STDIN=
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    PIPETEST_STDIN=true
fi

##
# Check if pipe input is empty.
##
assert_empty() {
  local actual_row=0

  while read actual; do
    if [[ -n "${actual}" ]]; then
      echo -n "Asserting error: expected empty input, actual contains \"${actual}\" "
      [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
      exit 1
    fi
  done && true

#  echo "AR: ${actual_row}"

  if [[ "${actual_row}" != "0" ]]; then
    echo -n "Asserting error: expected empty actual is \"${actual}\" "
    [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
    exit 1
  fi

  [[ -z "$1" ]] && echo "Found empty value as expected" || echo $1
}

##
#
##
assert_equals () {
  local actual_row=0
  local expect_row=0

  declare -a expect
  while read -r line; do
    expect[${expect_row}]="${line}"
    ((expect_row++))
  done < <(echo "$1") && true

  while read actual; do
    echo "DIFF[${actual_row}]: ${actual} <-> ${expect[${actual_row}]}"
    if [[ "${actual}" != "${expect[${actual_row}]}" ]]; then
      if [[ -z "$2" ]]; then
          echo -n "Asserting error: expected \"${expect[${actual_row}]}\" actual \"${actual}\" "
      else
          echo -n "$2 "
      fi
      [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
      exit 1
    fi
    ((actual_row++))
  done && true

  if [[ "${actual_row}" = "0" ]]; then
    if [[ -z "$2" ]]; then
      echo -n "Asserting error: expected \"$1\" actual is empty "
    else
      echo -n "$2 "
    fi
    [[ -z "${PIPETEST_STDIN}" ]] && echo "in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" || echo "from STDIN"
    exit 1
  fi

  [[ -z "$3" ]] && echo "Exact match over ${actual_row} line" || echo $3
}


##
#
##
assert_file_exists () {
  if [[ ! -f "$1" ]]; then
    echo "File '$1' does not exists."
    exit 1
  fi
}

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
  while read actual; do
    echo "DIFF[${actual_row}]: ${actual} <-> ${expect[${actual_row}]}"
  done && true

  if [ ! -d "$1" ]; then
    echo "Directory '$1' does not exists."
    exit 1
  fi
  echo ""
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
