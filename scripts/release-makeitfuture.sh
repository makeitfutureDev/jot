#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/build-makeitfuture.sh
python3 ../.agents/distribution/release.py "$PWD"
