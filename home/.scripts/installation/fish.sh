#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_command fish
require_command curl

if ! fish -c 'type -q fisher'; then
	info 'Installing Fisher.'
	fish -c 'curl --fail --silent --show-error https://git.io/fisher | source; and fisher install jorgebucaran/fisher'
else
	skip 'Fisher is already installed.'
fi

if fish -c 'type -q tide'; then
	skip 'Tide is already installed.'
else
	info 'Installing Tide.'
	fish -c 'fisher install IlanCosman/tide@v6'
fi
