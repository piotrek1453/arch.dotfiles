#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_command stow
run_from_repo stow -d "$REPO_ROOT/home" -t "$HOME" --no-folding \
	--ignore='^\.mozilla/firefox/arkenfox/user\.js$' \
	--ignore='^\.mozilla/firefox/arkenfox/prefsCleaner\.sh$' \
	--ignore='^\.mozilla/firefox/arkenfox/updater\.sh$' .
info 'Dotfiles are linked into HOME.'
