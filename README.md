# Pipetest

[![Build Status](https://travis-ci.com/javanile/pipetest.svg?branch=main)](https://travis-ci.com/javanile/pipetest)
![BASH](https://img.shields.io/badge/BASH-4%20%7C%205-lightgrey)

Pipetest is a simple and lightweight set of BASH functions useful 
to implement assertions with [I/O Redirection](https://tldp.org/LDP/abs/html/io-redirection.html). 

## Why Pipetest?

Thanks to the use of [Piping](https://en.wikipedia.org/wiki/Pipeline_(Unix)) it will be possible to create scripts 
that are easy to read and able to be understood by a wide audience. 
This makes Pipetest suitable for the following scenarios

- CI/CD Pipelines
- Ansible Playbooks
- Automated Testing
- Data Processing
- `build-release.sh | assert_equals "done."`

## Get started

Easy to install, simply download the file `pipetest.sh` into your project then load as source into your script.

## Installation

```bash
$ curl -sL https://git.io/pipetest.sh
```

```bash
#!/usr/bin/env bash
set -e

source pipetest.sh

echo "Hello World!" | assert_equals "Hello World!"
```

## Documentation 

- [`assert_empty`](#assert_empty) Check if stdout match as expected
- [`assert_equals`](#assert_equals) Check if stdout match as expected
- [`assert_file_exists`](#assert_file_exists) Check if file exists
- [`assert_directory_exists`](#assert_directory_exists) Check if directory exists

<hr/>

### `assert_empty`

**Usage**

```bash
assert_empty [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
echo "" | assert_empty
```

```bash
ls | assert_empty
```

```bash
cat apache2.log | assert_empty
```

<hr/>

### `assert_file_exists`

**Usage**

```bash
assert_file_exists [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
touch sample_file.txt
assert_file_exists sample_file.txt
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong."
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong." "Ok! it working."
```

<hr/>

### `assert_file_exists`

**Usage**

```bash
assert_file_exists [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
touch sample_file.txt
assert_file_exists sample_file.txt
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong."
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong." "Ok! it working."
```

<hr/>

### `assert_file_exists`

**Usage**

```bash
assert_file_exists [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
touch sample_file.txt
assert_file_exists sample_file.txt
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong."
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong." "Ok! it working."
```

<hr/>

### `assert_file_exists`

**Usage**

```bash
assert_file_exists [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
touch sample_file.txt
assert_file_exists sample_file.txt
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong."
```

```bash
mv old_file_name.txt new_file_name.txt
assert_file_exists new_file_name.txt "Moving file goes wrong." "Ok! it working."
```

<hr/>

## Contributing

See [CONTRIBUTING.md in the repo](https://github.com/asdf-vm/asdf/blob/master/CONTRIBUTING.md) or the [Contributing section on the docs site](http://asdf-vm.github.io/asdf/#/contributing-core-asdf).

## Community & Questions

- [![GitHub Issues](https://icongr.am/simple/github.svg?color=808080&size=16) GitHub Issues](https://github.com/javanile/pipetest/issues): report a bug or raise a feature request to the `pipetest` core team
- [![GitHub Discussions](https://icongr.am/simple/github.svg?color=808080&size=16) GitHub Discussions](https://github.com/javanile/pipetest/discussions): our preferred method for community Q&A and interaction
- [![StackOverflow Tag](https://icongr.am/fontawesome/stack-overflow.svg?size=16&color=808080) StackOverflow Tag](https://stackoverflow.com/questions/tagged/bash+unit-testing): see existing Q&A for `BASH` and `Unit Testing`. Some of the core team watch this tag in addition to our helpful community

## Short URLs

```bash
curl -i "https://git.io" \
     -d "url=https://raw.githubusercontent.com/javanile/lcov.sh/master/lcov.sh" \
     -d "code=lcov.sh"
```

## License

Pipetest is open-sourced software licensed under the [MIT license](LICENSE.md).
