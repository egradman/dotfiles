from pydantic import BaseModel, Field
from typing import Optional, List
import webcolors
import os
from uuid import uuid4
import jinja2

def _profiles():
    return Profiles(
        Profiles=[
            Profile.for_ssh("dmz", "egradman@dmz.gradman.com", COLOR_DEV, tmux=True),
            Profile.for_ssh(
                "minecraft",
                "root@minecraft.gradman.com",
                COLOR_PERSONAL_PRODUCTION,
                tmux=True,
            ),
            Profile.for_ssh(
                "homeassistant", "egradman@192.168.68.63", COLOR_PERSONAL_PRODUCTION
            ),
            Profile.for_ssh(
                "ECHT Raspberry Pi",
                "ubuntu@192.168.2.130",
                COLOR_WORK_PRODUCTION,
                tmux=True,
            ),
            Profile.for_ssh(
                "ACU",
                "rsadmi@192.168.2.1",
                COLOR_WORK_PRODUCTION,
                tmux=True,
                env={
                    "_SHELL": "./.eric_tools/bin/nu"
                }
            ),
            Profile.for_ssh(
                "eyecap",
                "rsadmi@172.16.186.128",
                COLOR_WORK_PRODUCTION,
                tmux=True,
            ),
        ]
    )



def to_space_case(string: str) -> str:
    return string.replace("_", " ")


class Color(BaseModel):
    r: float = Field(serialization_alias="Red Component")
    g: float = Field(serialization_alias="Green Component")
    b: float = Field(serialization_alias="Blue Component")
    Alpha_Component: float = 0

    Color_Space: str = "sRGB"


class Profile(BaseModel):
    Guid: str = Field(default_factory=lambda: uuid4().hex)

    Name: str
    Custom_Command: str = "Yes"
    Command: Optional[str]

    Background_Color: str
    Minimum_Contrast: float = 0.6
    Normal_Font: str = "SourceCodeProRoman-Regular 14"

    class Config:
        alias_generator = to_space_case
        populate_by_name = True

    @classmethod
    def for_ssh(cls, name, user_at_host, color, tmux=False, shell="zsh", env=None):
        if not env: env = {}
        env = " ".join(["=".join((key, value)) for key, value in env.items()])

        # color = webcolors.hex_to_rgb(color)

        if tmux:
            command = f"""ssh -t {user_at_host} {env} {shell} -l -c "tmux -u new-session -A -s main" """
        else:
            command = f"ssh -t {user_at_host}"

        return Profile(Name="!" + name, Command=command, Background_Color=color)

class Profiles(BaseModel):
    Profiles: List[Profile] = []


COLOR_DEV = "#002200"
COLOR_WORK_PRODUCTION = "#220000"
COLOR_PERSONAL_PRODUCTION = "#000022"

profiles = _profiles()

out = jinja2.Template(
    """#!/opt/homebrew/bin/python3
# @raycast.schemaVersion 1
# @raycast.title Kitty tab
# @raycast.mode silent
# @raycast.argument1 { "type": "dropdown", "placeholder": "host", "data": [ {% for profile in profiles %} {"title": "{{profile.Name[1:]}}", "value": "{{profile.Name[1:]}}"}, {% endfor %} ] }

import sys
import subprocess

match sys.argv[1].lower():
{% for profile in profiles %}
    case "{{profile.Name[1:].lower()}}":
        cmd = '''kitten @ launch --to=unix:`ls /tmp/kitty-* | tail -1` --type=tab --tab-title "{{profile.Name[1:]}}" --color background="{{profile.Background_Color}}" -- kitten {{profile.Command}} '''
{% endfor %}

print(cmd)
subprocess.run(cmd, shell=True)
"""
).render(profiles=profiles.Profiles)

with open("../raycast_scripts/kitty.py", "w") as f:
    f.write(out)
