#!/usr/bin/env python3

import subprocess

try:
    res = subprocess.check_output("icalBuddy -n -iep title,datetime -ic 9B7D4619-FF72-4833-B14B-D1F3AD9143CC eventsToday", shell=True).decode("utf8")
    title, datetime, _ = res.split("\n")[0:3]
    title = title[2:-11]
    datetime = datetime.strip()
    out = f"{datetime} {title}"
except ValueError as e:
    print(e)
    out = "no stupid meetings today!"
except subprocess.CalledProcessError:
    out = "no calendar"
print(out)

subprocess.call(f"""sketchybar --set "$NAME" icon="󰸗" label="{out}" """, shell=True)
