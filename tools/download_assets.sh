#!/usr/bin/env bash

VERSION=$1

LIST=(
    "go-auto-build-sample-macosx-$VERSION-amd64.tgz"
    "go-auto-build-sample-macosx-$VERSION-arm64.tgz"
    "go-auto-build-sample-macosx-$VERSION-universal.tgz"
    "go-auto-build-sample-linux-$VERSION-amd64.tgz"
    "go-auto-build-sample-linux-$VERSION-arm64.tgz"
    "go-auto-build-sample-windows-$VERSION-amd64.zip"
)

for filename in "${LIST[@]}"
do
    curl -L -O \
        -H "Authorization: Bearer $GITHUB_TOKEN" \
        https://github.com/jht5945/go-auto-build-sample/releases/download/v"$VERSION"/"$filename"
    shasum -a 256 "$filename" >> SHASUMS256.txt
done

cat ./SHASUMS256.txt
