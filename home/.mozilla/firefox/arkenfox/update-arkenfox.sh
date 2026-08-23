#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SOURCE_DIR="$(git -C "$(dirname "$SCRIPT_PATH")" rev-parse --show-toplevel)/home/.mozilla/firefox/arkenfox"
UPSTREAM_DIR="$SOURCE_DIR/arkenfox-upstream"
PROFILE_DIR="${FIREFOX_PROFILE_DIR:-$HOME/.mozilla/firefox/arkenfox}"

# update repo
git -C "$UPSTREAM_DIR" pull origin master
echo "Updating arkenfox repo"

# copy scripts
# rsync because cp doesn't handle repo symlink well
rsync -avL "$UPSTREAM_DIR/updater.sh" "$PROFILE_DIR/"
rsync -avL "$UPSTREAM_DIR/prefsCleaner.sh" "$PROFILE_DIR/"
rsync -avL "$UPSTREAM_DIR/user.js" "$PROFILE_DIR/"

# run scripts
cd "$PROFILE_DIR"
./updater.sh
./prefsCleaner.sh
echo "Arkenfox updated"
