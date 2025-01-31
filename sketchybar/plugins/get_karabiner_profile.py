#!/usr/bin/env python3

import subprocess
import sys

cur_profile = subprocess.check_output("karabiner_cli --show-current-profile-name", shell=True).decode("utf8").strip()
print(cur_profile)
subprocess.call(f"""sketchybar --set "keyboard" icon="" label="{cur_profile}" """, shell=True)
