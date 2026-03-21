.DEFAULT_GOAL := help
.PHONY: help install lint format check test

install: ## install
	uv sync --all-extras

lint: ## lint
	uv run ruff check .

format: ## format
	uv run ruff format .

check:  ## CI gate — fails if anything is wrong
	uv run ruff check .
	uv run ruff format --check .

test:  ## pytest
	uv run pytest

##@ Utility
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <target>\033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
