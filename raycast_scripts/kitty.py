#!/opt/homebrew/bin/python3
# @raycast.schemaVersion 1
# @raycast.title Kitty tab
# @raycast.mode silent
# @raycast.argument1 { "type": "dropdown", "placeholder": "host", "data": [  {"title": "dmz", "value": "dmz"},  {"title": "minecraft", "value": "minecraft"},  {"title": "homeassistant", "value": "homeassistant"},  {"title": "ECHT Raspberry Pi", "value": "ECHT Raspberry Pi"},  {"title": "ACU", "value": "ACU"},  {"title": "credence", "value": "credence"},  ] }

import sys
import subprocess

match sys.argv[1].lower():

    case "dmz":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "dmz" --color background="#002200" -- kitten ssh -t egradman@dmz.gradman.com 'export XDG_CONFIG_HOME=~/.config_egradman; export ZDOTDIR=~/.config_egradman/zsh; tmux new-session -A -s main ' '''

    case "minecraft":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "minecraft" --color background="#000022" -- kitten ssh -t root@minecraft.gradman.com 'export XDG_CONFIG_HOME=~/.config_egradman; export ZDOTDIR=~/.config_egradman/zsh; tmux new-session -A -s main ' '''

    case "homeassistant":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "homeassistant" --color background="#000022" -- kitten ssh -t egradman@192.168.68.63 '''

    case "echt raspberry pi":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "ECHT Raspberry Pi" --color background="#220000" -- kitten ssh -t ubuntu@192.168.2.130 'export XDG_CONFIG_HOME=~/.config_egradman; export ZDOTDIR=~/.config_egradman/zsh; tmux new-session -A -s main ' '''

    case "acu":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "ACU" --color background="#220000" -- kitten ssh -t rsadmi@192.168.2.1 'export XDG_CONFIG_HOME=~/.config_egradman; export ZDOTDIR=~/.config_egradman/zsh; tmux new-session -A -s main ' '''

    case "credence":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-*` --type=tab --tab-title "credence" --color background="#220000" -- kitten ssh -t rsadmi@192.168.8.8 'export XDG_CONFIG_HOME=~/.config_egradman; export ZDOTDIR=~/.config_egradman/zsh; tmux new-session -A -s main ' '''


print(cmd)
subprocess.run(cmd, shell=True)