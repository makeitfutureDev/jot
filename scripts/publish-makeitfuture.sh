#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 ../.agents/distribution/publish.py "$PWD"
