#!/usr/bin/env sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
BACKEND_DIR="$ROOT_DIR/backend"

echo "[backend] Starting backend validation"

if [ ! -d "$BACKEND_DIR" ]; then
  echo "[backend] Skipped: backend directory does not exist"
  exit 0
fi

cd "$BACKEND_DIR"

if [ -x "./mvnw" ]; then
  echo "[backend] Running Maven compile"
  ./mvnw -DskipTests compile
  echo "[backend] Running Maven tests"
  ./mvnw test
elif [ -f "pom.xml" ]; then
  echo "[backend] Running Maven compile"
  mvn -DskipTests compile
  echo "[backend] Running Maven tests"
  mvn test
else
  echo "[backend] Skipped: no pom.xml or Maven wrapper found"
fi
