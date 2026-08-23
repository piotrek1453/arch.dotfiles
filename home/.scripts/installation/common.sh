#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
INSTALLATION_DIR="$(dirname "$SCRIPT_PATH")"
REPO_ROOT="$(git -C "$INSTALLATION_DIR" rev-parse --show-toplevel)"

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
