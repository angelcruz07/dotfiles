# Dotfiles

## Descripción

Este repositorio contiene configuraciones personalizadas para un entorno de escritorio completo orientado al desarrollo, que incluye Qtile, Neovim, Fish, Zsh, Zellij, emuladores de terminal como WezTerm, Alacritty, y herramientas básicas de utilidad.

## Tabla de contenidos

- [Dotfiles](#dotfiles)
  - [Descripción](#descripción)
  - [Instalación de Arch](#instalación-de-arch)
  - [Instalar Xorg](#instalar-xorg)
  - [Gestor de inicio y gestor de ventanas](#gestor-de-inicio-y-gestor-de-ventanas)
  - [Software inicial](#software-inicial)
    - [Habilitar el gestor de inicio](#habilitar-el-gestor-de-inicio)
    - [Clonar el repositorio](#clonar-el-repositorio)
    - [Instalar fuentes](#instalar-fuentes)
    - [Copiar configuraciones](#copiar-configuraciones)
    - [Reiniciar el PC](#reiniciar-el-pc)
  - [Instalar AUR (Arch User Repository)](#instalar-aur-arch-user-repository)
  - [Audio](#audio)
  - [Bluetooth](#bluetooth)
  - [Brillo](#brillo)
  - [Fondo de pantalla](#fondo-de-pantalla)
  - [Monitores](#monitores)
  - [Asignaciones de teclas](#asignaciones-de-teclas)
  - [Aplicaciones](#aplicaciones)
  - [Software](#software)
  - [Terminal](#terminal)
  - [Neovim](#neovim)
  - [Fuentes, temas y GTK](#fuentes-temas-y-gtk)
  - [Probar tu gestor de ventanas](#probar-tu-gestor-de-ventanas)
  - [Galería](#galería)
    - [Qtile](#qtile)

## Descripción General

Esta guía te guiará en el proceso de construcción de un entorno de escritorio comenzando con una instalación limpia de Arch. Asumiré que ya estás familiarizado con sistemas operativos basados en Linux y la línea de comandos. Si estás leyendo esto, también asumiré que has investigado sobre gestores de ventanas en mosaico (tiling window managers), porque esa es la base de esta configuración. Puedes elegir cualquier gestor de ventanas que prefieras, pero yo usaré Qtile como primer gestor de ventanas en mosaico, ya que es con el que comencé.

Esta es una descripción de cómo construí mi entorno de escritorio desde cero.

## Instalación de Arch

La guía comienza justo después de una instalación limpia de Arch. Para más detalles, consulta la [guía de instalación oficial de Arch](https://wiki.archlinux.org/title/installation_guide).

Mis sugerencias: [Guía de instalación personalizada](install/README.md).

## Instalar Xorg

Xorg es una implementación del sistema X Window para sistemas operativos tipo Unix, como Linux. Es uno de los componentes clave para proporcionar una interfaz gráfica en estos sistemas.

Para instalar Xorg, ejecuta:

```bash
sudo pacman -S xorg --noconfirm
```

Consulta más sobre Xorg en su [página oficial](https://wiki.archlinux.org/title/Xorg).

## Gestor de Inicio y Gestor de Ventanas

Primero, necesitamos asegurarnos de poder iniciar sesión y abrir programas como un navegador y un terminal, por lo que empezaremos instalando LightDM y Qtile. LightDM no funcionará sin un "greeter". También necesitaremos un terminal y un editor de texto.

### Software Inicial

Instala el software básico necesario para que mi configuración funcione correctamente:

```bash
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter \
qtile wezterm firefox rofi neofetch htop base-devel pulseaudio \
pavucontrol feh exa neovim flameshot unzip thunar picom arandr \
brightnessctl --noconfirm
```

Información adicional sobre este software en la sección [Software](#software).

### Habilitar el Gestor de Inicio

Para poder iniciar sesión en Qtile, debes habilitar el gestor de inicio (LightDM):

```bash
sudo systemctl enable lightdm
```

### Clonar el Repositorio

Clona el repositorio de mis configuraciones:

```bash
git clone https://github.com/angelcruz07/dotfiles.git
```

### Instalar Fuentes

Instala las fuentes utilizadas en mi configuración. En mi caso, uso **IosevkaTerm**, **CascadiaCode**, y **Ubuntu Mono Nerd**.

Descarga las fuentes desde su sitio oficial o desde el [repositorio de Nerd Fonts en GitHub](https://github.com/ryanoasis/nerd-fonts), o ejecuta:

```bash
sudo pacman -S ttf-ubuntu-mono-nerd ttf-cascadia-code ttf-iosevkaterm-nerd
```

### Copiar Configuraciones

Copia las configuraciones desde el repositorio clonado:

```bash
cp -r ~/dotfiles/AlexcodeQtile/qtile/ ~/.config/
cp -r ~/dotfiles/AlexcodeRofi/rofi/ ~/.config/
cp -r ~/dotfiles/AlexcodeNvim/nvim/ ~/.config/
cp -r ~/dotfiles/AlexcodeZellij/zellij/ ~/.config/
cp -r ~/dotfiles/AlexcodeDots/ ~/
```

### Reiniciar el PC

Reinicia tu PC para verificar que todo haya salido bien:

```bash
reboot
```

Si todo se configuró correctamente, deberías ver mi entorno con el tema actual.

### Instalar Homebrew

Homebrew es un gestor de paquetes para macOS y Linux que te permitirá instalar y actualizar herramientas fácilmente. Para instalarlo, ejecuta:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Incluye Homebrew en tu perfil de shell:

```bash
# Reemplaza 'YourUserName' con tu nombre de usuario en el dispositivo
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/YourUserName/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### Instalar AUR (Arch User Repository)

Para instalar AUR, primero verifica si tienes `git` instalado:

```bash
sudo pacman -S git
```

Clona el repositorio de `yay` y compílalo:

```bash
# Clona el repositorio
git clone https://aur.archlinux.org/yay-git.git
cd yay-git

# Compila e instala yay
makepkg -si
```

## Audio

Para configurar el audio, instala `pulseaudio` y su herramienta de control:

```bash
sudo pacman -S pulseaudio pavucontrol
```

## Bluetooth

Habilita el servicio Bluetooth:

```bash
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
sudo systemctl status bluetooth.service
```

## Brillo

Para ajustar el brillo de la pantalla, instala `brightnessctl`:

```bash
sudo pacman -S brightnessctl
```

## Fondo de Pantalla

Para configurar el fondo de pantalla, instala `feh` y configura tu archivo `.xprofile`:

```bash
# Instala feh
sudo pacman -S feh

# Establece el fondo de pantalla en tu archivo .xprofile
feh --bg-scale /ruta/a/imagen.jpg
```

## Monitores

Instala `arandr` para gestionar la configuración de múltiples monitores:

```bash
sudo pacman -S arandr
```

Consulta mi archivo de configuración en [xprofile](/.xprofile).

## Asignaciones de Teclas

Aquí están las asignaciones de teclas para la navegación y gestión de ventanas en Qtile. El **mod** es la tecla "Super" (usualmente la tecla Windows).

### Teclas Básicas

- **mod + h**: Enfocar ventana a la izquierda
- **mod + l**: Enfocar ventana a la derecha
- **mod + j**: Enfocar ventana abajo
- **mod + k**: Enfocar ventana arriba
- **mod + space**: Mover enfoque a la otra ventana

### Movimiento de Ventanas

- **mod + shift + h**: Mover ventana a la izquierda
- **mod + shift + l**: Mover ventana a la derecha

| Tecla           | Acción                         |
| --------------- | ------------------------------ |
| mod + j         | Siguiente ventana (abajo)      |
| mod + k         | Siguiente ventana (arriba)     |
| mod + shift + h | Decrecer tamaño del maestro    |
| mod + shift + l | Incrementar tamaño del maestro |

## Aplicaciones

| Tecla   | Acción                                 |
| ------- | -------------------------------------- |
| mod + m | Lanzar rofi                            |
| mod + b | Lanzar navegador (Firefox)             |
| mod + e | Lanzar explorador de archivos (Thunar) |

## Software

Lista de software utilizado en este entorno de escritorio.

| Software  | Descripción                                 |
| --------- | ------------------------------------------- |
| arandr    | Gestión de pantallas múltiples              |
| bat       | Visor de archivos con resaltado de sintaxis |
| feh       | Configuración de fondos de pantalla         |
| flameshot | Herramienta                                 |
