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
            Profile.for_ssh("proxbox", "rsadmin@192.168.2.200", COLOR_WORK_PRODUCTION, tmux=True),
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
            ),
            Profile.for_ssh(
                "ACU through proxy",
                "rsadmi@192.168.2.1",
                COLOR_WORK_PRODUCTION,
                tmux=True,
                extra_args="-J rsadmin@10.1.20.71 -L61000:localhost:61000 -L60000:localhost:60000"
            ),
            Profile.for_ssh(
                "mbp",
                "egradman@dmz.gradman.com",
                COLOR_WORK_PRODUCTION,
                tmux=False,
                extra_args="-p 2222"
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
    def for_ssh(cls, name, user_at_host, color, tmux=False, shell="zsh", extra_args=None, env=None):
        if not env: env = {}
        env = " ".join(["=".join((key, value)) for key, value in env.items()])

        # color = webcolors.hex_to_rgb(color)

        if tmux:
            command = f"""ssh -A {extra_args} -t {user_at_host} {env} {shell} -l -c ".dotfiles/scripts/tmux-resume-main.sh" """
        else:
            command = f"ssh -A {extra_args} -t {user_at_host}"

        return Profile(Name="!" + name, Command=command, Background_Color=color)

class Profiles(BaseModel):
    Profiles: List[Profile] = []


COLOR_DEV = "#002200"
COLOR_WORK_PRODUCTION = "#220000"
COLOR_PERSONAL_PRODUCTION = "#000022"

profiles = _profiles()

for profile in profiles.Profiles:
    out = jinja2.Template(
"""#!/run/current-system/sw/bin/python3.12
# @raycast.schemaVersion 1
# @raycast.title {{profile.Name[1:]}} terminal
# @raycast.mode silent

import sys
import subprocess

cmd = '''/run/current-system/sw/bin/kitten @ launch --to=unix:`ls -tr /tmp/kitty-* | tail -1` --type=tab --tab-title "{{profile.Name[1:]}}" --color background="{{profile.Background_Color}}" -- /run/current-system/sw/bin/kitten {{profile.Command}} '''

subprocess.run(cmd, shell=True)
with open("/tmp/last_terminal_cmd.sh", "w") as f:
    f.write(cmd)
print("/tmp/last_terminal_cmd.sh")
"""
    ).render(profile=profile)

    with open(f"../raycast_scripts/hosts/{profile.Name[1:]}.py", "w") as f:
        f.write(out)
