#!/usr/bin/env sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
FRONTEND_DIR="$ROOT_DIR/frontend"

echo "[frontend] Starting frontend validation"

if [ ! -d "$FRONTEND_DIR" ]; then
  echo "[frontend] Skipped: frontend directory does not exist"
  exit 0
fi

cd "$FRONTEND_DIR"

if [ ! -f "package.json" ]; then
  echo "[frontend] Skipped: no package.json found"
  exit 0
fi

if [ -f "package-lock.json" ]; then
  echo "[frontend] Installing npm dependencies with npm ci"
  npm ci
fi

echo "[frontend] Running lint"
npm run lint

echo "[frontend] Running build"
npm run build
