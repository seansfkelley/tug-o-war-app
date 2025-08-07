#!/usr/bin/env zsh

set -euo pipefail

exec poetry run fastapi dev src/main.py
