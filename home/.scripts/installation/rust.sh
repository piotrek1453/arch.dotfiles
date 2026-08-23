#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_arch
require_non_root
require_command sudo

if ! command -v rustup >/dev/null 2>&1 || ! command -v makepkg >/dev/null 2>&1; then
	info 'Installing rustup and base-devel.'
	sudo pacman -S --needed --noconfirm rustup base-devel
fi

require_command rustup
rustup toolchain install nightly
rustup default nightly
info 'Rust nightly is installed and selected as the default toolchain.'
