#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_arch
require_non_root
require_command makepkg
require_command rustup

if command -v paru >/dev/null 2>&1; then
	skip 'paru is already installed.'
	exit 0
fi

info 'Building paru from the local PKGBUILD.'
run_from_repo bash -c 'cd paru && makepkg -si --noconfirm --needed -C -f'
