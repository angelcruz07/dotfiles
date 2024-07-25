from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys

# Icons https://www.nerdfonts.com/cheat-sheet
# Arch - nf-md-arch
# Code - nf-cod-code
# Terminal - nf-otc-termininal
# Web - nf-fa-firefox
# Miselaneos - nf-fa-cube

#  Groups
groups = [Group(i) for i in [
   "  󰣇   ", "     ",  "     ", "     ", "     " 
]]


for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
