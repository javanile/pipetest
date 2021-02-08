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

**Usage**

```bash
assert_file_exists FILENAME [FAIL_MESSAGE] [SUCCESS_MESSAGE]
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

## TL;DR

> not now :-)

### Short url

```bash
curl -i "https://git.io" \
     -F "url=https://raw.githubusercontent.com/javanile/lcov.sh/master/lcov.sh" \
     -F "code=lcov.sh"
```

## Contributing

See [CONTRIBUTING.md in the repo](https://github.com/asdf-vm/asdf/blob/master/CONTRIBUTING.md) or the [Contributing section on the docs site](http://asdf-vm.github.io/asdf/#/contributing-core-asdf).

## Community & Questions

- [![GitHub Issues](https://icongr.am/simple/github.svg?color=808080&size=16) GitHub Issues](https://github.com/javanile/pipetest/issues): report a bug or raise a feature request to the `pipetest` core team
- [![GitHub Discussions](https://icongr.am/simple/github.svg?color=808080&size=16) GitHub Discussions](https://github.com/javanile/pipetest/discussions): our preferred method for community Q&A and interaction
- [![StackOverflow Tag](https://icongr.am/fontawesome/stack-overflow.svg?size=16&color=808080) StackOverflow Tag](https://stackoverflow.com/questions/tagged/bash+unit-testing): see existing Q&A for `BASH` and `Unit Testing`. Some of the core team watch this tag in addition to our helpful community
