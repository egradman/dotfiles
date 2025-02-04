#!/usr/bin/env python3

import subprocess
import re


def get_ip(interface):
    try:
        res = subprocess.check_output(f"ifconfig {interface}", shell=True).decode("utf8")
    except subprocess.CalledProcessError:
        return "?"
    match = re.search(r"inet (.*?) ", res)
    ip = match.group(1)
    return ip

ip = get_ip("en0")

subprocess.call(f"""sketchybar --set "$NAME" label="{ip}" """, shell=True)
