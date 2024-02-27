#!/usr/bin/env bash
set -e

#trap 'fail' EXIT

source ./pipetest.sh
source ./test/functions.sh

( echo "ciao"; echo "cosa" ) | assert_equals "$(cat <<EOF
ciao
aosa
asd
EOF
)"
