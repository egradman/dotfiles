#!/usr/bin/env python3

import subprocess
import re

calendars = [
    "9B7D4619-FF72-4833-B14B-D1F3AD9143CC", # work
    "883797BA-ED99-420C-8F13-90DD8C6FA7C4", # family
    "07599C48-AEC6-4A52-B57C-1A8E1645492F" # personal
]

try:
    for calendar in calendars:
        try:
            res = subprocess.check_output(f"icalBuddy -n -iep title,datetime -ic {calendar} eventsToday", shell=True).decode("utf8")
        except subprocess.CalledProcessError as e:
            continue
        print(res)
    title, datetime, _ = res.split("\n")
    title = re.sub(r'\s*\([^)]*\)\s*$', '', title)

    datetime = datetime.strip()
    out = f"{datetime} {title}"
except ValueError:
    out = "nothing today!"

subprocess.call(f"""sketchybar --set "$NAME" icon="󰸗" label="{out}" """, shell=True)
