if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

# User paths
## for IDE installed from AUR, doesn't work for now so import from manually installed one is needed as below
## fish_add_path /opt/gowin-eda-ide/bin 
fish_add_path $HOME/Tools/Gowin/IDE/bin
## my scripts
fish_add_path $HOME/.scripts
## Xilinx tools
### Xilinx base path
set xilinx_root $HOME/Tools/Xilinx
### Choose path to latest version
set latest_version (ls $xilinx_root | grep -E '^[0-9]+\.[0-9]+' | sort -V | tail -n 1)
fish_add_path $xilinx_root/$latest_version/Vitis/bin
fish_add_path $xilinx_root/$latest_version/Vivado/bin
# Created by `pipx` on 2025-03-21 19:39:15
fish_add_path PATH $PATH /home/$USER/.local/bin

# Aliases
alias yay=paru
alias pacman=sudo pacman

# display full path in prompt
set -U fish_prompt_pwd_dir_length 0
