#!/usr/bin/env python3

import subprocess
import sys

GREEN="0xff8DC07C"
RED="0xffFB4A34"

# check if the ynot keyboard is connected
res = subprocess.check_output("blueutil --connected", shell=True).decode("utf8")
if "AirPods Pro" in res:
    icon_color = GREEN
else:
    icon_color = RED

subprocess.call(f"""sketchybar --set "headphones" icon="" icon.color="{icon_color}" """, shell=True)
