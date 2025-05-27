#!/usr/bin/env bash

set -e

VERSION=$1

if [[ "$VERSION" == *"-beta" ]]; then
  echo "beta. skip."
else
  RELEASE_ID=$(curl -fsSL \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/jht5945/go-auto-build-sample/releases/tags/v"$VERSION" | jq '.["id"]')

  DATA='{"draft":false,"prerelease":false,"make_latest":true}'

  curl -fsSL \
    -X PATCH \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/jht5945/go-auto-build-sample/releases/"$RELEASE_ID" \
    -d "$DATA"
fi
