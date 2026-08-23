#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_non_root
require_arch
require_command sudo

PACMAN_CONFIG="$REPO_ROOT/system/etc/pacman.conf"
MAKEPKG_CONFIG="$REPO_ROOT/system/etc/makepkg.conf"

[[ -f "$PACMAN_CONFIG" ]] || die "Missing pacman configuration: $PACMAN_CONFIG"
[[ -f "$MAKEPKG_CONFIG" ]] || die "Missing makepkg configuration: $MAKEPKG_CONFIG"

info 'Installing system configuration into /etc.'
sudo install -Dm644 "$PACMAN_CONFIG" /etc/pacman.conf
sudo install -Dm644 "$MAKEPKG_CONFIG" /etc/makepkg.conf
# FOR CICD ONLY !!! Podman image can't build with sandbox enabled
if [[ "${PACMAN_DISABLE_SANDBOX:-0}" == 1 ]]; then
	sudo sed -i 's/^#DisableSandbox/DisableSandbox/' /etc/pacman.conf
fi
sudo pacman -Sy --noconfirm
info 'System configuration installed.'
