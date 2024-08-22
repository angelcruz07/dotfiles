# Dotfiles

Esta es mi configuracion para mi
entorno de escritorio Arch Linux con soporte
para dos monitores de 24 y 26 pulgadas,
he separado mi configuracion de mi laptop
por un sencilla razon, se requiren algunas
configuraciones especiales y adaptadas
para que funcione correctamente y trabajar comodo
realmente no varia demasiado, si estas interesado
en verla la encontraras en [AlexcodeLaptop](../AlexcodeLaptop)

## Arch Linux - Qtile

Bienvenido si estas leyendo esto es
por que quires aprender a crear tu entorno de escritorio
con Arch Linux.

## Instalacion de Arch Linux

Para comenzar asegurate de tener una Instalacion
limpia de Arch Linux.

Wiki [arch](https://wiki.archlinux.org/title/installation_guide)
Mis recomendaciones [Installation](/install/README.md)

## Instalar Xorg

Xorg es una implementación del sistema de ventanas X para sistemas operativos tipo Unix, como Linux. Es uno de los componentes fundamentales para proporcionar una interfaz gráfica en estos sistemas.

[xorg](https://wiki.archlinux.org/title/Xorg)

```bash
sudo pacman -S xorg
```

## Inicio de sesion y gestor de ventanas

Primero necesitamos de una manera de iniciar sesion y abrir porgramas
como editores de codigo, navegadores o terminales para esto esteremos
utilizando [lighdm](https://wiki.archlinux.org/title/LightDM) y
[qtile](https://wiki.archlinux.org/title/Qtile) lightdm no funcionara si
no tienes un [gretter](https://wiki.archlinux.org/title/LightDM#Greeter)
al igual necesitaremos de una terminal en mi caso yo utilizo [alacritty](https://alacritty.org/)

### Instalar software basico

Primero necesitamos instalar el software
basico para poder hacer funcionar mi
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
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter qtile alacritty firefox rofi neofetch htop base-devel pulseaudio pavucontrol feh exa neovim flameshot unzip thunar picom
```

Mas info sobre este software en []()

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

## Atajos basicos Qtile

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
