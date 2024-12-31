# Dotfiles

Esta es mi configuracion para mi
entorno de escritorio Arch Linux con soporte
para dos monitores de 24 y 26 pulgadas,
he separado mi configuracion de mi laptop
por un sencilla razon, se requiren algunas
configuraciones especiales y adaptadas
para que funcione correctamente y trabajar comodo.

## Arch Linux

Bienvenido si estas leyendo esto es
por que quires aprender a crear tu entorno de escritorio
con Arch Linux.

## Instalacion de Arch Linux

Para comenzar asegurate de tener una Instalacion
limpia de Arch Linux.

Wiki [Arch Linux](https://wiki.archlinux.org/title/installation_guide)
Mis recomendaciones [Installation](/install/README.md)

## Instalar Xorg

xorg es una implementación del sistema de ventanas X
para sistemas operativos tipo Unix, como Linux.
Es uno de los componentes fundamentales para
proporcionar una interfaz gráfica en estos sistemas.

[xorg](https://wiki.archlinux.org/title/Xorg)

```bash
sudo pacman -S xorg --noconfirm
```

## Inicio de sesion y gestor de ventanas

Primero necesitamos de una manera de iniciar sesión y abrir programas
como editores de código, navegadores o terminales para esto esteremos
utilizando [lighdm](https://wiki.archlinux.org/title/LightDM) y
[qtile](https://wiki.archlinux.org/title/Qtile) lightdm no funcionara si
no tienes un [gretter](https://wiki.archlinux.org/title/LightDM#Greeter)
al igual necesitaremos de una terminal en mi caso yo utilizo
[WezTerm](https://wezfurlong.org/wezterm/index.html)

### Instalar software básico

Primero necesitamos instalar el software
básico para poder hacer funcionar mi
configuracion.

- lightdm
- Qtile
- Alacritty
- Firefox
- Rofi
- Neofetch
- Base devel
- exa
- unzip
- Thunar
- Flameshot
- Htop
- NeoVim
- Picom

```bash
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter \
qtile alacritty firefox rofi neofetch htop base-devel pulseaudio \
pavucontrol feh exa neovim flameshot unzip thunar picom arandr \
brightnessctl --noconfirm
```

Mas info sobre este software en [Software]()

### Habilitar el login manager

Para que puedas iniciar sesion en Qtile deberas de habilitarlo primero.

```bash
sudo systemctl enable lightdm
```

### Clonar repositorio

Clonar el repositorio de mis configuraciones

```bash
git clone https://github.com/angelcruz07/dotfiles.git
```

### Instalar fuentes

Antes de continuar vamos a instalar las fuentes
que usa mi configuracion, en mi caso utilizo UbuntuMono Nerd Font y CascadiaCode.

```bash
sudo pacman -S ttf-ubuntu-mono-nerdfont ttf-cascadia-code
```

### Copear mi configuracion

Copea mi configuracion para ver los cambios

```bash
cp -r ~/dotfiles/AlexcodeDesktop/.config ~/
```

### Reinicio del PC

Reinicia tu pc para revisar que todo a salido bien

```bash
reboot
```

Dale un vistazo a los atajos de teclado configurados
en [atajos](#atajos-basicos-qtile), si has echo los pasos bien deberias tener la vista de mi entorno
con el tema que estoy utilizando actualmente.

## Atajos Qtile

| Atajo                | Acción                              |
| -------------------- | ----------------------------------- |
| **mod + enter**      | abrir alacritty                     |
| **mod + k**          | ventana siguiente                   |
| **mod + j**          | ventana anterior                    |
| **mod + w**          | cerrar ventana                      |
| **mod + [12345678]** | ir al espacio de trabajo [12345678] |
| **mod + ctrl + r**   | reiniciar qtile                     |
| **mod + ctrl + q**   | cerrar sesión                       |

Antes de continuar si tu distribucion del teclado nose
encuentra en ingles deberias cambiarla, abre **alacritty**
con **mod + enter** la tecla mod es la tecla con el icono de windows en tu teclado.

```bash
setxkbmap es
```

Ten en cuenta que este cambio no es permanente, si reinicias el PC tendras que escribir
el comando anterior de nuevo.

## Apps

| Key             | Action                      |
| --------------- | --------------------------- |
| mod + m         | Launch rofi                 |
| mod + shift + m | Window nav (rofi)           |
| mod + b         | Lunch Browser(Firefox)      |
| mod + e         | Lunch File explores(thunar) |
| mod + return    | Luch Terminal (Alacritty)   |
| mod + r         | Redshift                    |
| mod + shift + r | Stop redshift               |
| mod + s         | Screenshot (scrot)          |
| mod + c         | Launch VsCode               |

## Software

Lista de software usada en mi entorno de escritorio.

| Software               | Utility                                |
| ---------------------- | -------------------------------------- |
| arandr                 | Manage multiple screens                |
| bat                    | View files with syntax highlighting    |
| blueman                | Bluetooth control                      |
| bluez                  | Bluetooth stack                        |
| bluez-utils            | Bluetooth utilities                    |
| brightnessctl          | Laptop screen brightness               |
| cbatticon              | Battery icon                           |
| exa                    | List files visually                    |
| feh                    | Wallpaper setter                       |
| flameshot              | Screenshot                             |
| libnotify              | Receive notifications                  |
| lxappearance           | GUI for changing themes                |
| network-manager-applet | NetworkManager systray                 |
| networkmanager         | Self explanatory                       |
| notification-daemon    | Notifications                          |
| ntfs-3g                | Read mounted USB in Windows            |
| picom                  | Compositor for Xorg                    |
| pip                    | Python package manager                 |
| pulseaudio             | Audio control                          |
| pulseaudio-bluetooth   | Bluetooth audio support for PulseAudio |
| qiv                    | Image viewer                           |
| ranger                 | Terminal based explorer                |
| rofi                   | Menu and window switcher               |
| scrot                  | Screenshots                            |
| thunar                 | Graphical file explorer                |
| udiskie                | Automounter                            |
| unzip                  | Unzip files                            |
| vlc                    | Media player                           |
| volumeicon             | Audio icon                             |
| xcb-util-cursor        | Change theme cursor                    |

## Terminal

| Software  | Utility           | Pacman                                           |
| --------- | ----------------- | ------------------------------------------------ |
| Alacritty | Terminal emulator | sudo pacman -S alacritty                         |
| Kitty     | Terminal emulator | sudo pacman -S kitty                             |
| WezTerm   | Terminal emulator | https://wezfurlong.org/wezterm/installation.html |

## Neovim

| Software          | Utility   | Pacman                             |
| ----------------- | --------- | ---------------------------------- |
| nvim              | Editor    | sudo pacman -S neovim              |
| xsel              | Clipboard | sudo pacman -S xsel                |
| fzf               | Finder    | sudo pacman -S fzf                 |
| ripgrep           | Finder    | sudo pacman -S ripgrep             |
| fd                | Finder    | sudo pacman -S fd                  |
| the_silver_search |           | sudo pacman -S the_silver_searcher |
| prettier          | Formater  | sudo pacman -S prettier            |
