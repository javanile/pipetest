# ⛲ Pipetest

[![Build Status](https://travis-ci.com/javanile/pipetest.svg?branch=main)](https://travis-ci.com/javanile/pipetest)
[![License](https://img.shields.io/github/license/shellspec/shellspec.svg)](https://github.com/shellspec/shellspec/blob/master/LICENSE)

Pipetest is a [simple and lightweight](#-pipetest "(but powerful)") set of shell functions useful
to implement assertions with [I/O Redirection](https://tldp.org/LDP/abs/html/io-redirection.html).

## Why Pipetest?

Thanks to the use of [Piping](https://en.wikipedia.org/wiki/Pipeline_(Unix)) it will be possible to create scripts 
that are easy to read and able to be understood by a wide audience. 
This makes Pipetest suitable for the following scenarios

- CI/CD Pipelines
- Ansible Playbooks
- Automated Testing
- Data Processing

In other words, everything that can refer to this

```bash
./build-something.sh | assert_equals "done."`
```

## Suppoerted Shells

We try to do everything possible to ensure maximum compatibility with these platforms

[![bash](https://img.shields.io/badge/bash-&ge;2.03-lightgrey.svg?style=flat)](https://www.gnu.org/software/bash/)
[![bosh](https://img.shields.io/badge/bosh-&ge;2018%2F10%2F07-lightgrey.svg?style=flat)](http://schilytools.sourceforge.net/bosh.html)
[![busybox](https://img.shields.io/badge/busybox-&ge;1.20.0-lightgrey.svg?style=flat)](https://www.busybox.net/)
[![dash](https://img.shields.io/badge/dash-&ge;0.5.4-lightgrey.svg?style=flat)](http://gondor.apana.org.au/~herbert/dash/)
[![ksh](https://img.shields.io/badge/ksh-&ge;93s-lightgrey.svg?style=flat)](http://kornshell.org)
[![mksh](https://img.shields.io/badge/mksh-&ge;R28-lightgrey.svg?style=flat)](http://www.mirbsd.org/mksh.htm)
[![posh](https://img.shields.io/badge/posh-&ge;0.3.14-lightgrey.svg?style=flat)](https://salsa.debian.org/clint/posh)
[![yash](https://img.shields.io/badge/yash-&ge;2.29-lightgrey.svg?style=flat)](https://yash.osdn.jp/)
[![zsh](https://img.shields.io/badge/zsh-&ge;3.1.9-lightgrey.svg?style=flat)](https://www.zsh.org/)

## Get Started

Pipetest is just one file, put the file `pipetest.sh` into your project then load as source into your script.

## Installation

```bash
$ curl -o pipetest.sh https://github.com/javanile/pipetest/releases/download/v0.1.0/pipetest.sh
```

```bash
#!/usr/bin/env bash
set -e

source pipetest.sh

echo "Hello World!" | assert_equals "Hello World!"
```

## Documentation 

There are the lists of supported functions

- [**assert_empty**](#assert_empty) - Fails if piped output is not empty
- [**assert_not_empty**](#assert_not_empty) - Fails if piped output is empty
- [**assert_equals**](#assert_equals) - Fails if piped output not match with the argument
- [**assert_not_equals**](#assert_not_equals) - Fails if piped output match with the argument 
- [**assert_starts_with**](#assert_starts_with) - Fails if piped output match with the argument
- [**assert_ends_with**](#assert_ends_with) - Fails if piped output match with the argument
- [**assert_match**](#assert_match) - Fails if piped output match with the argument
- [**assert_file_exists**](#assert_file_exists) - Fails if piped file name as text not exists
- [**assert_file_not_exists**](#assert_file_not_exists) - Fails if piped file name as text exists
- [**assert_directory_exists**](#assert_directory_exists) - 
- [**assert_directory_not_exists**](#assert_directory_not_exists)

<hr/>

<div align="center">

### `assert_empty`

</div>

Fails if piped output is not empty.

**Usage**

```bash
... | assert_empty [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```

**Examples**

```bash
echo "" | assert_empty
```

```bash 
ls | assert_empty "Current directory is not empty"
```

```bash
cat apache2.log | assert_empty "Log file is not empty"
```

<div align="right">[[back to top]](#documentation)</div>

<hr/>

### ➡ | `assert_empty`

**Usage**

```bash
... | assert_empty [FAIL_MESSAGE] [SUCCESS_MESSAGE]
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

[[back to top]](#documentation)

<hr/>

### ➡ | `assert_file_exists`

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

[[back to top]](#documentation)

<hr/>

### ➡ | `assert_file_exists`

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

[[back to top]](#documentation)

<hr/>

### ➡ | `assert_file_exists`

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

[[back to top]](#documentation)

<hr/>

### ➡ | `assert_directory_exists`

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

[[back to top]](#documentation)

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
