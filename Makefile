
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

## =======
## Testing
## =======
test:
	@bash lcov.sh test/*.test.sh -x lcov.sh

test-assert-empty:
	@bash test/assert_empty.test.sh

test-assert-equals:
	@bash test/assert_equals.test.sh

## =====
## CI/CD
## =====
travis-pull:
	@docker-compose -f test/travis/docker-compose.yml pull > /dev/null

travis-test:
	@docker-compose -f test/travis/docker-compose.yml run --rm travis test/travis/test-runner.sh
