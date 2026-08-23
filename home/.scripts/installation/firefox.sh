#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

FIREFOX_DIR="$HOME/.mozilla/firefox/arkenfox"
SOURCE_FIREFOX_DIR="$REPO_ROOT/home/.mozilla/firefox/arkenfox"
SOURCE_UPSTREAM_DIR="$SOURCE_FIREFOX_DIR/arkenfox-upstream"
if [[ ! -d "$FIREFOX_DIR" ]]; then
	skip 'Arkenfox profile is not present.'
	exit 0
fi

[[ -d "$SOURCE_UPSTREAM_DIR" ]] || die "Missing Arkenfox upstream submodule in $SOURCE_UPSTREAM_DIR"
require_command bash
require_command git
require_command rsync

git -C "$SOURCE_UPSTREAM_DIR" rev-parse --is-inside-work-tree >/dev/null ||
	die "Arkenfox upstream is not a Git repository: $SOURCE_UPSTREAM_DIR"

if [[ ! -f "$FIREFOX_DIR/update-arkenfox.sh" || ! -d "$FIREFOX_DIR/arkenfox-upstream" ]]; then
	require_command stow
	info 'Restoring missing Arkenfox links.'
	run_from_repo stow -d "$REPO_ROOT/home" -t "$HOME" --no-folding \
		--ignore='^\.mozilla/firefox/arkenfox/user\.js$' \
		--ignore='^\.mozilla/firefox/arkenfox/prefsCleaner\.sh$' \
		--ignore='^\.mozilla/firefox/arkenfox/updater\.sh$' .
fi

[[ -f "$FIREFOX_DIR/update-arkenfox.sh" ]] || die "Missing Arkenfox updater in $FIREFOX_DIR"
[[ -d "$FIREFOX_DIR/arkenfox-upstream" ]] || die "Missing Arkenfox links in $FIREFOX_DIR"
if [[ ! -f "$FIREFOX_DIR/prefs.js" ]]; then
	skip 'Firefox profile has no prefs.js; skipping Arkenfox cleanup.'
	exit 0
fi

run_from_repo env FIREFOX_PROFILE_DIR="$FIREFOX_DIR" bash -c \
	'cd "$1" && ./update-arkenfox.sh' _ "$FIREFOX_DIR"
info 'Arkenfox profile is updated.'
