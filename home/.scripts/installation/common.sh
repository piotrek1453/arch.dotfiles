#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
INSTALLATION_DIR="$(dirname "$SCRIPT_PATH")"
if REPO_ROOT_FROM_GIT="$(git -C "$INSTALLATION_DIR" rev-parse --show-toplevel 2>/dev/null)"; then
	REPO_ROOT="$REPO_ROOT_FROM_GIT"
else
	# Fallback for environments where .git is intentionally not copied (e.g. Docker build context).
	REPO_ROOT="$(realpath "$INSTALLATION_DIR/../../..")"
fi

export INSTALLATION_DIR REPO_ROOT

info() {
	printf '[INFO] %s\n' "$*"
}

skip() {
	printf '[SKIP] %s\n' "$*"
}

die() {
	printf '[ERROR] %s\n' "$*" >&2
	exit 1
}

require_command() {
	command -v "$1" >/dev/null 2>&1 || die "Required command not found: $1"
}

require_non_root() {
	[[ "$EUID" -ne 0 ]] || die 'Run the installer as a normal user, not root.'
}

require_arch() {
	[[ -r /etc/arch-release ]] || die 'This installer supports Arch Linux only.'
}

run_from_repo() {
	(
		cd "$REPO_ROOT"
		"$@"
	)
}
