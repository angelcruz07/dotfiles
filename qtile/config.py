# Qtile Config File
# http://www.qtile.org/

from libqtile import hook
from libqtile.lazy import lazy

#  Load configs
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults
from settings.screens import screens
from settings.keys import mod, keys, terminal
from settings.mouse import mouse
from settings.path import qtile_path
from os import path

import subprocess


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, "autostart.sh")])

@hook.subscribe.client_new
def set_no_decoration(client):
    # la clase de ghostty suele ser 'ghostty'
    if client.name == 'ghostty':
        # 1. quitar el borde/decoración de qtile
        client.cmd_set_border_width(0)
        # 2. opcional: asegurarse de que no sea flotante (aunque no debería serlo)
        # client.cmd_disable_floating()
        
    # intenta también usar la clase, por si el nombre es inconsistente:
    if client.window.get_wm_class() and 'ghostty' in client.window.get_wm_class()[0].lower():
        client.cmd_set_border_width(0)

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
wmname = "LG3D"
