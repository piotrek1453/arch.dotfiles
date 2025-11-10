if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

# Created by `pipx` on 2025-03-21 19:39:15
set PATH $PATH /home/$USER/.local/bin

# User paths
# for IDE installed from AUR, doesn't work for now so import from manually installed one is needed as below
# fish_add_path /opt/gowin-eda-ide/bin 
fish_add_path $HOME/Tools/Gowin/IDE/bin
fish_add_path $HOME/.scripts

# Aliases
alias yay=paru
alias pacman=sudo pacman

# display full path in prompt
set -U fish_prompt_pwd_dir_length 0
