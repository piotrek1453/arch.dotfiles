#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

if git -C "$REPO_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	run_from_repo git submodule update --init --recursive
	info 'Git submodules are initialized.'
else
	skip 'Skipping submodule initialization because .git is not available.'
fi
