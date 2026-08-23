#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

run_from_repo git submodule update --init --recursive
info 'Git submodules are initialized.'
