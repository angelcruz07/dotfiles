from libqtile import widget
import subprocess
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg="text", bg="dark", fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=3)


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="",  # Icon: nf-oct-triangle_left
        fontsize=60,
        padding=5,
    )


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="IosevkaTerm",
            fontsize=25,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            highlight_method="block",
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["dark"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=16, padding=10),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    powerline("color1", "dark"),
    widget.Pomodoro(
        background=colors["color1"],
        foreground=colors["text"],
        color_brake=colors["urgent"],
        color_active=colors["text"],
        color_inactive=colors["inactive"],
    ),
    powerline("color4", "color1"),
    icon(bg="color4", text="  "),  # Icon: nf-fa-download
    widget.CheckUpdates(
        background=colors["color4"],
        colour_have_updates=colors["text"],
        colour_no_updates=colors["text"],
        no_update_string="0",
        display_format="{updates}",
        update_interval=180,
        custom_command="checkupdates",
    ),
    # Uncomment if have graphic nvidia
    # powerline("color4", "color2"),
    # widget.GenPollText(
    #     func=lambda: subprocess.check_output("~/scripts/nvidia_usage.sh", shell=True)
    #     .decode("utf-8")
    #     .strip(),
    #     update_interval=1,
    #     foreground=colors["text"],
    #     background=colors["color4"],
    # ),
    # powerline("color3", "color4"),
    # widget.NvidiaSensors(
    #     format="GPU: {temp}°C",
    #     foreground=colors["text"],
    #     background=colors["color3"],
    #     update_interval=1,
    # ),
    powerline("color2", "color4"),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.55),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    powerline("color1", "color2"),
    icon(bg="color1", fontsize=17, text=" "),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg="color1"), format="%d/%m/%Y - %H:%M "),
    powerline("color2", "color1"),
    widget.KeyboardLayout(
        **base(bg="color2"),
        configured_keyboards=[
            "us intl",
            "us",
            "es",
        ],
    ),
    powerline("dark", "color2"),
    widget.Systray(background=colors["dark"], padding=5),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    powerline("color1", "dark"),
    widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65),
    widget.CurrentLayout(**base(bg="color1"), padding=5),
    powerline("color2", "color1"),
    widget.Clock(**base(bg="color2"), format="%d/%m/%Y - %H:%M "),
    powerline("dark", "color2"),
]

widget_defaults = {
    "font": "IosevkaTerm Nerd Font Bold",
    "fontsize": 16,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
