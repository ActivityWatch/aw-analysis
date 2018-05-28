.PHONY: build test run

build:
	pip install . -r requirements.txt

test: typecheck
	python -m pytest tests

typecheck:
	MYPYPATH="numpy-data/numpy-mypy/" python -m mypy --ignore-missing-imports aw_research/ examples/*

vis-aw-development:
	python3 -m aw_client --host localhost:5666 query --json --start 2018-01-01 queries/aw-development.awq > .cache-query-result
	python3 examples/plot_timeperiods.py .cache-query-result

