#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_command curl
PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
export PNPM_HOME

if ! command -v pnpm >/dev/null 2>&1; then
	info 'Installing pnpm.'
	curl --fail --silent --show-error https://get.pnpm.io/install.sh | sh -
	for pnpm_bin in "$PNPM_HOME/bin/pnpm" "$PNPM_HOME/pnpm"; do
		if [[ -x "$pnpm_bin" ]]; then
			pnpm_dir="$(dirname "$pnpm_bin")"
			export PATH="$pnpm_dir:$PATH"
			break
		fi
	done
fi

require_command pnpm
PACKAGE_FILE="$REPO_ROOT/home/.scripts/installation/pnpm_packages.txt"
mapfile -t packages < <(awk '
  /^[[:space:]]*#/ || /^[[:space:]]*$/ { next }
  { sub(/[[:space:]]+#.*/, ""); gsub(/^[[:space:]]+|[[:space:]]+$/, ""); if (length) print }
' "$PACKAGE_FILE")

if ((${#packages[@]} == 0)); then
	skip 'No pnpm packages are listed.'
	exit 0
fi

pnpm install --global "${packages[@]}"
info 'Global pnpm packages are installed.'
