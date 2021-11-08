PACKAGE_DIR=sample_package/
TEST_DIR=tests/
PATH_LINT_SCORE=.github/pylint.txt
PATH_LINT_BADGE=.github/pylint.svg
PATH_COV_BADGE=.github/coverage.svg

# lists all available targets
list:
	@sh -c "$(MAKE) -p no_targets__ | \
		awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {\
			split(\$$1,A,/ /);for(i in A)print A[i]\
		}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
# required for list
no_targets__:

install:
	@python -m pip install --upgrade pip
	@poetry install

clean:
	@rm -rf build dist .eggs *.egg-info
	@rm -rf .benchmarks .coverage coverage.xml htmlcov report.xml
	@rm -rf mypycov
	@find . -type d -name '.mypy_cache' -exec rm -rf {} +
	@find . -type d -name '__pycache__' -exec rm -rf {} +
	@find . -type d -name '*pytest_cache*' -exec rm -rf {} +
	@find . -type f -name "*.py[co]" -exec rm -rf {} +

envclean: clean
	@rm -rf .venv
	@rm -rf .cache

format:
	@poetry run isort ./
	@poetry run black ./

# requirements.txt is only used for GitHub vulnerability alert.
# GitHub does not support poetry yet, so this file is needed.
# <https://docs.github.com/en/free-pro-team@latest/github/visualizing-repository-data-with-graphs/about-the-dependency-graph#supported-package-ecosystems>
requirements:
	@poetry export --without-hashes -f requirements.txt -o requirements.txt

# Ref on automatic generation of linter badge: https://stackoverflow.com/questions/43126475/pylint-badge-in-gitlab
lint:
	@poetry run pylint-fail-under --fail_under 9.0 $(PACKAGE_DIR) | tee $(PATH_LINT_SCORE)
	@score=$$(sed -n 's/^Your code has been rated at \([-0-9.]*\)\/.*/\1/p' $(PATH_LINT_SCORE)); \
	poetry run anybadge --value=$$score --file=$(PATH_LINT_BADGE) --label=pylint -o
	@poetry run pylint-fail-under --fail_under 9.0 -d C0116,W0621,W0212,W0611,R0801 $(TEST_DIR)

check_types:
	@poetry run mypy -p $$(echo $(PACKAGE_DIR) | sed 's/^\///;s/\// /g')
	@poetry run mypy -p $$(echo $(TEST_DIR) | sed 's/^\///;s/\// /g')
	

test:
	@poetry run pytest  \
	$(TEST_DIR) --cov=$(PACKAGE_DIR) --cov-report html:./htmlcov \
	--cov-fail-under 90
	@poetry run coverage-badge -fo $(PATH_COV_BADGE)