#!/usr/bin/env python3

import subprocess
import sys

GREEN="0xff8DC07C"
RED="0xffFB4A34"

# check if the ynot keyboard is connected
res = subprocess.check_output("blueutil --connected", shell=True).decode("utf8")
if "ynot" in res:
    icon_color = GREEN
else:
    icon_color = RED

cur_profile = subprocess.check_output("karabiner_cli --show-current-profile-name", shell=True).decode("utf8").strip()
print(cur_profile)
subprocess.call(f"""sketchybar --set "keyboard" icon="" icon.color="{icon_color}" label="{cur_profile}" """, shell=True)
