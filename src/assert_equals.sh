
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

  while read -r actual; do
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

  [[ -z "$3" ]] && echo "Exact match over ${actual_row} line" || echo "$3"
}

