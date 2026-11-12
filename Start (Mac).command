#!/bin/bash
# Double-click this file to open the Trader Dashboard on a Mac.
cd "$(dirname "$0")" || exit 1

PY=""
for c in python3 /opt/homebrew/bin/python3 /usr/local/bin/python3 /usr/bin/python3; do
  if command -v "$c" >/dev/null 2>&1 && "$c" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)' 2>/dev/null; then
    PY="$c"; break
  fi
done

if [ -z "$PY" ]; then
  echo ""
  echo "  Python 3.9 or newer is needed and was not found."
  echo "  Opening the Python download page. Install it, then double-click Start (Mac) again."
  echo ""
  open "https://www.python.org/downloads/"
  read -r -p "Press Return to close this window."
  exit 1
fi

echo "Starting Trader Dashboard..."
"$PY" -I app/server.py
echo ""
echo "The dashboard has stopped. Your data is saved in the \"trader\" folder."
