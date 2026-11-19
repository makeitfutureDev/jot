#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist/Jot.app/Contents/MacOS dist/Jot.app/Contents/Resources .build
cp resources/Info.plist dist/Jot.app/Contents/Info.plist
cp resources/AppIcon.icns dist/Jot.app/Contents/Resources/
for arch in arm64 x86_64; do
    xcrun swiftc -target "$arch-apple-macos14.0" -O src/*.swift -o ".build/Jot-$arch"
done
lipo -create .build/Jot-arm64 .build/Jot-x86_64 -output dist/Jot.app/Contents/MacOS/Jot

python3 ../.agents/distribution/prepare.py "$PWD" "$PWD/dist/Jot.app"
python3 ../.agents/distribution/sign.py "$PWD" "$PWD/dist/Jot.app"
