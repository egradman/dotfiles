#!/opt/homebrew/bin/python3
# @raycast.schemaVersion 1
# @raycast.title Kitty tab
# @raycast.mode silent
# @raycast.argument1 { "type": "dropdown", "placeholder": "host", "data": [  {"title": "dmz", "value": "dmz"},  {"title": "minecraft", "value": "minecraft"},  {"title": "homeassistant", "value": "homeassistant"},  {"title": "ECHT Raspberry Pi", "value": "ECHT Raspberry Pi"},  {"title": "ACU", "value": "ACU"},  {"title": "credence", "value": "credence"},  {"title": "eyecap", "value": "eyecap"},  ] }

import sys
import subprocess

match sys.argv[1].lower():

    case "dmz":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "dmz" --color background="#002200" -- kitten ssh -t egradman@dmz.gradman.com tmux new-session -A -s main '''

    case "minecraft":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "minecraft" --color background="#000022" -- kitten ssh -t root@minecraft.gradman.com tmux new-session -A -s main '''

    case "homeassistant":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "homeassistant" --color background="#000022" -- kitten ssh -t egradman@192.168.68.63 '''

    case "echt raspberry pi":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "ECHT Raspberry Pi" --color background="#220000" -- kitten ssh -t ubuntu@192.168.2.130 tmux new-session -A -s main '''

    case "acu":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "ACU" --color background="#220000" -- kitten ssh -t rsadmi@192.168.2.1 tmux new-session -A -s main '''

    case "credence":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "credence" --color background="#220000" -- kitten ssh -t rsadmi@192.168.8.8 tmux new-session -A -s main '''

    case "eyecap":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "eyecap" --color background="#220000" -- kitten ssh -t rsadmi@192.168.2.2 tmux new-session -A -s main '''


print(cmd)
subprocess.run(cmd, shell=True)