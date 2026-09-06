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

require_command cargo
CARGO_PACKAGE_FILE="$REPO_ROOT/home/.scripts/installation/rust_packages.txt"
mapfile -t cargo_packages < <(awk '
  /^[[:space:]]*#/ || /^[[:space:]]*$/ { next }
  { sub(/[[:space:]]+#.*/, ""); gsub(/^[[:space:]]+|[[:space:]]+$/, ""); if (length) print }
' "$CARGO_PACKAGE_FILE")

for package in "${cargo_packages[@]}"; do
	if cargo install --list | awk -v package="$package" '$1 == package { found = 1 } END { exit !found }'; then
		skip "Cargo package already installed: $package"
	else
		info "Installing Cargo package: $package"
		cargo install "$package"
	fi
done

info 'Rust nightly is installed and selected as the default toolchain.'
