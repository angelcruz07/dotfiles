screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    foreground=["#f1ffff", "#f1ffff"],
                    background=["#0f101a", "#0f101a"],
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
                    this_current_screen_border=["f07178","f07178"],
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
                widget.Systray(),
                widget.Sep(
                    background=["#0f101a", "#0f101a"],
                    linewidth=0,
                    padding=5,
                ),
                widget.Image(
                    filename=path.join(path.expanduser('~'), '.config', 'qtile', 'img', 'bar2.png' )
                ),
                widget.CurrentLayoutIcon(
                    foreground=["#0f101a", "#0f101a"],
                    background=["f07178","f07178"],
                    scale=0.65
                ),
                widget.CurrentLayout(
                    foreground=["#0f101a", "#0f101a"],
                    background=["f07178","f07178"],
                ),
                widget.Sep(
                    background=["f07178","f07178"],
                    linewidth=0,
                    padding=5,
                ),
                widget.Image(
                    filename=path.join(path.expanduser('~'), '.config', 'qtile', 'img', 'bar1.png' )
                ),
                widget.TextBox(
                    background=["#a151d3","#a151d3"],
                    foreground=["#0f101a", "#0f101a"],
                    text="'",
                ),
                widget.Clock(
                    background=["#a151d3","#a151d3"],
                    foreground=["#0f101a", "#0f101a"],
                    padding=5,
                    format="%d-%m-%y - %H:%M"
                ),
            ],
            26,
            opacity= 0.95
        ),
    ),
]
