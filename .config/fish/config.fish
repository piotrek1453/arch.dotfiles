if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

# Created by `pipx` on 2025-03-21 19:39:15
set PATH $PATH /home/$USER/.local/bin

# User paths
fish_add_path /opt/gowin-eda-ide/bin

# User venv - workaround for global litex install
if test -f $HOME/.venv/bin/activate.fish
    . "$HOME/.venv/bin/activate.fish"
end

# Aliases
alias yay=paru
alias pacman=sudo pacman

# pnpm
set -gx PNPM_HOME "/home/$USER/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
