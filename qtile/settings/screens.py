# Angel Cruz

# Multimonitor support

from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
from .widgets import primary_widgets, secondary_widgets
import subprocess

def status_bar(widgets):
    return bar.Bar(widgets, 24, opacity=0.92)


screens = [Screen(top=status_bar(primary_widgets))]

# Detectar monitores conectados
try:
    command = subprocess.run(
        ["xrandr", "--query"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    if command.returncode == 0:
        # Contar monitores conectados
        connected_monitors = len([line for line in command.stdout.split('\n') 
                                  if ' connected' in line])
    else:
        logger.warning("No se pudo ejecutar xrandr, usando 1 monitor por defecto")
        connected_monitors = 1
except Exception as e:
    logger.error(f"Error detectando monitores: {e}")
    connected_monitors = 1

# Agregar pantallas adicionales si hay más de un monitor
if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=status_bar(secondary_widgets)))
