#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_command curl

load_ghcup_env() {
	if [[ -f "$HOME/.ghcup/env" ]]; then
		# shellcheck disable=SC1090
		source "$HOME/.ghcup/env"
	fi
}

load_ghcup_env
if command -v ghc >/dev/null 2>&1 && command -v cabal >/dev/null 2>&1; then
	skip 'GHC and Cabal are already installed.'
	exit 0
fi

if ! command -v ghcup >/dev/null 2>&1; then
	info 'Installing GHCup.'
	export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
	curl --fail --silent --show-error --proto '=https' --tlsv1.2 \
		https://get-ghcup.haskell.org | sh
	load_ghcup_env
fi

require_command ghcup
if ! command -v ghc >/dev/null 2>&1; then
	ghcup install ghc recommended
	ghcup set ghc recommended
fi
if ! command -v cabal >/dev/null 2>&1; then
	ghcup install cabal latest
	ghcup set cabal latest
fi

info 'GHC and Cabal are installed.'
