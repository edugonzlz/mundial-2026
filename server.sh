#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
PORT=${1:-8000}
echo "Sirviendo $DIR en http://localhost:$PORT"
python3 -m http.server "$PORT" --directory "$DIR" &
SERVER_PID=$!
open "http://localhost:$PORT"
trap "kill $SERVER_PID 2>/dev/null; exit" INT TERM
wait $SERVER_PID
