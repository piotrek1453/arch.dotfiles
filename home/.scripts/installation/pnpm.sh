#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

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
