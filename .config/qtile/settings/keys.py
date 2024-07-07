#Angel Cruz

#Qtile  keybindings
from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # ------------ Window Configs ------------ #

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        
    # Change window sizes (MonadTall)
    Key([mod, "shift"], "l", lazy.layout.grow()),
    Key([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows up or down in current stack
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Kill window
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Restart Qtile
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    # Quit Qtile
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # ------------ Layout Configs ------------ #

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",),

    # ------------ App Configs ------------ #

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Toggle fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window",),

    #Apps
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    #Menu Rofi
    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),

    #Window nav 
    Key([mod , "shift"], "m", lazy.spawn("rofi -show"),desc="Window nav"),
    
    #File explorer
    Key([mod], "e", lazy.spawn("thunar"), desc="Spawn file explorer"),

    #Screenshot
    Key([], "Print", lazy.spawn("scrot /home/angel/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"), desc="Take Screenshot"),
    Key([mod], "Print", lazy.spawn("scrot -s /home/angel/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"), desc="Take Screenshot custom"),
    Key([mod], "s", lazy.spawn("flameshot"), desc="Take Screenshot custom"),

    #Browser
    Key([mod], "b", lazy.spawn("firefox"), desc="Open browser"), 

    #Audio
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86TouchpadToggle", lazy.spawn("xinput disable ELAN0307:00 04F3:3282 toggle")),

    #Editors
    Key([mod], "i", lazy.spawn("idea"), desc="Open intellij"),
    Key([mod], "c", lazy.spawn("code"), desc="Open vscode"),
  
   #Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]