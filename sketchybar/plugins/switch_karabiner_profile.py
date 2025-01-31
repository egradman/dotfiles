#!/usr/bin/env python3

import subprocess
import sys

def set_profile(profile):
    subprocess.check_output(f"karabiner_cli --select-profile {profile}", shell=True)
    subprocess.call(f"""sketchybar --set "keyboard" icon="" label="{profile}" """, shell=True)

cur_profile = subprocess.check_output("karabiner_cli --show-current-profile-name", shell=True).decode("utf8").strip()

if cur_profile == "ik_off":
    set_profile("ik_on")
elif cur_profile == "ik_on":
    set_profile("ik_off")


