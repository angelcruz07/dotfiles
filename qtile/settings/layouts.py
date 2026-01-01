# Angel Cruz 08-08-25

from libqtile import layout
from libqtile.config import Match
from .theme import colors

layout_conf = {"border_focus": colors["focus"][0], "border_width": 1, "margin": 4}

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.Matrix(columns=2, **layout_conf),
    layout.RatioTile(**layout_conf),
    # layout.Bsp(**layout_conf),
    # layout.Columns(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        # Ventanas comunes que deben flotar
        Match(wm_class="pavucontrol"),  # Control de volumen
        Match(wm_class="blueman-manager"),  # Gestor Bluetooth
        Match(wm_class="nm-connection-editor"),  # Editor de conexiones de red
        Match(wm_class="file_progress"),  # Diálogos de progreso de archivos
        Match(wm_class="file-roller"),  # Gestor de archivos comprimidos
        Match(wm_class="flameshot"),  # Herramienta de captura de pantalla
        Match(wm_class="galculator"),  # Calculadora
        Match(wm_class="lxappearance"),  # Editor de temas GTK
        Match(wm_class="lxrandr"),  # Configuración de pantallas
        Match(wm_class="message"),  # Mensajes del sistema
        Match(wm_class="splash"),  # Pantallas de inicio
        Match(wm_class="toolbar"),  # Barras de herramientas
        Match(wm_class="confirm"),  # Diálogos de confirmación
        Match(wm_class="dialog"),  # Diálogos genéricos
        Match(wm_class="download"),  # Diálogos de descarga
        Match(wm_class="error"),  # Diálogos de error
        Match(wm_class="notification"),  # Notificaciones
        Match(wm_class="splash"),  # Pantallas de inicio
        Match(wm_class="task_dialog"),  # Diálogos de tareas
        Match(wm_class="Arandr"),  # Configurador de pantallas
        Match(wm_class="feh"),  # Visor de imágenes
        Match(wm_class="Gimp"),  # GIMP (algunas ventanas)
        Match(wm_class="kcalc"),  # Calculadora KDE
        Match(wm_class="kmix"),  # Mezclador de audio KDE
        Match(wm_class="krunner"),  # Ejecutor de comandos KDE
        Match(wm_class="ksmserver"),  # Servidor de sesión KDE
        Match(wm_class="plasma"),  # Plasma
        Match(wm_class="systemsettings"),  # Configuración del sistema
        Match(wm_class="Plasma"),  # Plasma (mayúsculas)
        Match(wm_class="krunner"),  # Ejecutor de comandos
        Match(wm_class="Kmix"),  # Mezclador de audio
        Match(wm_class="Klipper"),  # Portapapeles
        Match(wm_class="Kopete"),  # Mensajería
        Match(wm_class="KOrganizer"),  # Organizador
        Match(wm_class="kmail"),  # Cliente de correo
        Match(wm_class="knote"),  # Notas
        Match(wm_class="kwriteconfig"),  # Configuración
        Match(wm_class="sweeper"),  # Limpiador
        Match(title="pinentry"),  # Entrada de PIN GPG
        Match(title="Authentication"),  # Autenticación
        Match(title="isomaster"),  # Editor de ISO
    ],
    border_focus=colors["color4"][0],
)

