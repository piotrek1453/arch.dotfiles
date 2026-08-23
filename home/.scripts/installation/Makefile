SHELL := /usr/bin/bash

INSTALLATION_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
REPO_ROOT := $(shell git -C "$(INSTALLATION_DIR)" rev-parse --show-toplevel)

.PHONY: all help prerequisites submodules rust paru packages haskell stow fish pnpm hooks firefox

all: prerequisites submodules rust paru packages haskell stow fish pnpm hooks

help:
	@printf '%s\n' \
		'Usage: make [target]' \
		'' \
		'Targets:' \
		'  all            Run every installation step except for firefox' \
		'  prerequisites  Check the host system and required bootstrap tools' \
		'  submodules     Initialize and update Git submodules' \
		'  rust           Install rustup and select the nightly toolchain' \
		'  paru           Build and install the local paru package' \
		'  packages       Install packages from system_packages.txt' \
		'  haskell        Install GHCup, GHC, and Cabal' \
		'  stow           Link the dotfiles into HOME' \
		'  fish           Install Fisher and the Tide theme' \
		'  pnpm           Install pnpm and global packages' \
		'  hooks          Install the pre-commit Git hook' \
		'  firefox        Update the Arkenfox profile when present (optional)'

prerequisites:
	"$(INSTALLATION_DIR)/prerequisites.sh"

submodules: prerequisites
	"$(INSTALLATION_DIR)/submodules.sh"

rust: prerequisites
	"$(INSTALLATION_DIR)/rust.sh"

paru: rust
	"$(INSTALLATION_DIR)/paru.sh"

packages: paru
	"$(INSTALLATION_DIR)/packages.sh"

haskell: packages
	"$(INSTALLATION_DIR)/haskell.sh"

stow: packages
	"$(INSTALLATION_DIR)/stow.sh"

fish: stow
	"$(INSTALLATION_DIR)/fish.sh"

pnpm: stow
	"$(INSTALLATION_DIR)/pnpm.sh"

hooks: packages
	cd "$(REPO_ROOT)" && pre-commit install

firefox: stow
	"$(INSTALLATION_DIR)/firefox.sh"
