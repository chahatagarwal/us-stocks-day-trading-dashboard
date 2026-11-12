#!/bin/sh
# Linux: run ./start-linux.sh from this folder (or double-click and choose "Run").
cd "$(dirname "$0")" || exit 1
exec python3 -I app/server.py "$@"
