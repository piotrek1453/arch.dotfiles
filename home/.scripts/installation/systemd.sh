#!/usr/bin/env bash

source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/common.sh"

# Add user unit names here as they are added to the dotfiles.
USER_TIMERS=(
	'backup-sync-poufne.timer'
)
USER_SERVICES=(
	'lspmux.service'
)

require_command systemctl

USER_UNIT_DIR="$HOME/.config/systemd/user"

for timer_unit in "${USER_TIMERS[@]}"; do
	[[ -f "$USER_UNIT_DIR/$timer_unit" ]] || die "User timer unit not found: $USER_UNIT_DIR/$timer_unit (run the stow step first)."
done
for service_unit in "${USER_SERVICES[@]}"; do
	[[ -f "$USER_UNIT_DIR/$service_unit" ]] || die "User service unit not found: $USER_UNIT_DIR/$service_unit (run the stow step first)."
done

systemctl --user daemon-reload
for timer_unit in "${USER_TIMERS[@]}"; do
	systemctl --user enable --now "$timer_unit"
	info "Enabled and started user timer: $timer_unit"
done
for service_unit in "${USER_SERVICES[@]}"; do
	systemctl --user enable --now "$service_unit"
	info "Enabled and started user service: $service_unit"
done
