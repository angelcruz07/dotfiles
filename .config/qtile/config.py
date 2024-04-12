from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

#Configs
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.keys import mod, keys, terminal
from settings.mouse import mouse
from settings.path import qtile_path

from os import path
import subprocess


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])

# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

widget_defaults = dict(
    font="UbuntuMono Nerd Font",
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()
path_image_bar = path.expanduser('~'), '.config', 'qtile', 'img', 'bar1.png'

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    foreground=["#f1ffff", "#f1ffff"],
                    background=["#0E0F1B", "#0E0F1B"],
                    font="UbuntuMono Nerd Font",
                    fontsize=19,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=5,
                    border_width=1,
                    active=["#f1ffff", "#f1ffff"],
                    inactive=["#f1ffff", "#f1ffff"],
                    rounded=False,
                    highlight_method='block',
                    this_current_screen_border=["#323948","#323948"],
                    this_current_border=["#5c5c5c", "#5c5c5c"],
                    other_current_screen_border=["#0f101a", "#0f101a"],
                    other_screen_border=["#0f101a", "#0f101a"],
                ),
                widget.WindowName(
                    foreground=["#a151d3","#a151d3"],
                    background=["#0f101a", "#0f101a"],
                    fontsize=14,
                    font="UbuntuMono Nerd Font Bold",

                ),
                widget.Systray(
                    background=["0f101a","0f101a"]
                ),
                widget.Image(
                    filename=path.join(path.expanduser('~'), '.config', 'qtile', 'img', 'bar3.png')
                ),
                widget.TextBox(
                    background=["#0FBB3F","#0FBB3F"],
                    foreground=["#ffffff", "#ffffff"],
                    text="",
                    padding=10,
                ),
                widget.CheckUpdates(
                    foreground=["#0f101a", "#0f101a"],
                    background=["#0FBB3F", "#0FBB3F"],
                    no_update_string='0',
                    padding=5,
                ),
                widget.Sep(
                    background=["#0FBB3F", "#0FBB3F"],
                    linewidth=0,
                    padding=5,
                ),
                 widget.TextBox(
                    background=["3572A5","3572A5"],
                    foreground=["#ffffff", "#ffffff"],
                    text="",
                    padding=20,
                ),
                widget.Net(
                    background=["#3572A5","#3572A5"],
                    padding=10,                
                ),
                widget.Sep(
                    background=["#3572A5","#3572A5"],
                    linewidth=0,
                    padding=5,
                ),
                widget.Image(
                    filename=path.join(path.expanduser('~'), '.config', 'qtile', 'img', 'bar2.png')
                ),
                widget.CurrentLayoutIcon(
                    foreground=["#ffffff", "#ffffff"],
                    background=["f07178","f07178"],
                    scale=0.65
                ),
                widget.CurrentLayout(
                    foreground=["#ffffff", "#ffffff"],
                    background=["f07178","f07178"],
                ),
                widget.Sep(
                    background=["f07178","f07178"],
                    linewidth=0,
                    padding=5,
                ),
                widget.Image(
                    filename=path.join(path.expanduser('~'), '.config', 'qtile', 'img', 'bar1.png')
                ),
                widget.TextBox(
                    background=["#a151d3","#a151d3"],
                    foreground=["#ffffff", "#ffffff"],
                    text="'",
                ),
                widget.Clock(
                    background=["#a151d3","#a151d3"],
                    foreground=["#ffffff", "#ffffff"],
                    padding=5,
                    format="%d-%m-%y - %H:%M"
                ),
            ],
            26,
            opacity= 0.95
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
# If things like steam games want to auto-minimize themselves when losing
auto_minimize = True
# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
# java that happens to be on java's whitelist.
wmname = "LG3D"
