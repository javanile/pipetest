
.PHONY: test

ifeq ($(OS),Windows_NT)
    UNAME := Win32
else
    UNAME := $(shell uname -s)
endif

install-lib:
ifeq ($(UNAME),Darwin)
	@brew install gnu-getopt lcov
endif

install-dev:
	@curl -sLO https://git.io/lcov.sh

#install: install-lib install-dev

improve:
	@gpte -i .

## =======
## Testing
## =======

test:
	@bash test/bare/test-runner.sh

test-assert-equals:
	@bash test/bare/assert_equals.test.sh

test-assert-directory-exists:
	@bash test/assert_directory_exists.test.sh

test-assert-empty:
	@bash test/assert_empty.test.sh

test-posix:
	@bash test/posix/test-runner.sh

## =====
## CI/CD
## =====

travis-pull:
	@docker-compose -f test/travis/docker-compose.yml pull

travis-test:
	@docker-compose -f test/travis/docker-compose.yml run --rm travis
