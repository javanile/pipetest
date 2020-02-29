# Pipetest

Pipetest is a simple an lightweight set of bash functions useful to implement assertions on your script or modern test suites. 

## Get started

Easy to install, simply download the file `pipetest.sh` into your project then load as source into your BASH script.

```bash
$ curl -sL https://git.io/pipetest.sh
```

```bash
#!/usr/bin/env bash
set -e

source pipetest.sh

echo "Hello World!" | assert_equals "Hello World!"
```

## Functions 

- [`assert_file_exists`](#assert_file_exists): Check if file exists
- `assert_directory_exists`: Check if directory exists
- `assert_equals`: Check if stdout match as expected

<hr/>

### `assert_file_exists`

**Usage:**

```bash
assert_file_exists FILENAME
```

**Examples:**

```bash
SAMPLE_FILE=sample_file.txt
touch ${SAMPLE_FILE}
assert_file_exists ${SAMPLE_FILE}
```

## TL;DR

> not now :-)

### Short url

```bash
curl -i "https://git.io" \
     -F "url=https://raw.githubusercontent.com/javanile/lcov.sh/master/lcov.sh" \
     -F "code=lcov.sh"
```
