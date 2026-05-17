#!/usr/bin/env sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

echo "[all] Running workspace validation"
"$ROOT_DIR/scripts/test-backend.sh"
"$ROOT_DIR/scripts/test-frontend.sh"
echo "[all] Validation complete"
