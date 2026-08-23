#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

require_non_root
require_arch
require_command git
require_command readlink
require_command awk
require_command sudo
require_command make
require_command curl

info 'Host system satisfies installer prerequisites.'
