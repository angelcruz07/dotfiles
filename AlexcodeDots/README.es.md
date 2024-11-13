# Arch Linux Desktop

Esta es mi configuracion para mi
entorno de escritorio Arch Linux con soporte
para dos monitores de 24 y 26 pulgadas,
he separado mi configuracion de mi laptop
por un sencilla razon, se requiren algunas
configuraciones especiales y adaptadas
para que funcione correctamente y trabajar comodo
realmente no varia demasiado, si estas interesado
en verla la encontraras en [AlexcodeLaptop](../AlexcodeLaptop)

- Copea mi configuracion

```bash
cp -r ~/dotfiles/AlexcodeDesktop/.config/ ~/
```

## Arch Linux - Qtile

Bienvenido si estas leyendo esto es
por que quires aprender a crear tu entorno de escritorio
con Arch Linux.

## Vista previa

Te guiare a tener tu entorno personalizado
con Arch Linux, tratare ser lo mas minimalista
posible para que tu puedas modificarlo a tu gusto.

Si quieres copear directamente mi configuracion ve al final de este documento.

## Instalacion

Para comenzar asegurate de tener una Instalacion
limpia de Arch Linux.

Wiki [arch](https://wiki.archlinux.org/title/installation_guide)
Mis recomendaciones [Installation](/install/README.md)

## Instalar Xorg

Primero que todo debemos tener xorg instalado.

```bash
sudo pacman -S xorg
```

## Login y manejador de ventanas (Qtile)

Para poder iniciar Qtile deberemos tener un manejador
de sessiones en mi caso utilizo lightdm, ademas instalaremos
un poco de software adicional como terminal, navegador, compositor,
rofi, neofetch, htop.

Puedes observar para que sirve este software en la seccion

- Instalar software basico

```bash
sudo pacman -S lightdm lightdm-gtk-greeter
lightdm-webkit2-greeter qtile alacritty firefox
rofi neofetch base-devel pulseaudio pavucontrol feh
```

Con el anterior comando instalaremos el software necesario
para que funciones minimamente nuestro sistema operativo
pero aun nos falta mas software por instalar y configurar.

### Habilitar el login manager

Para que puedas iniciar sesion en Qtile deberas de habilitarlo
primero.

```bash
sudo systemctl enable lightdm
```

- Copear mi configuracion

```bash
cp -r ~/dotfiles/AlexcodeDesktop/.config ~/
```

veras que todo el entorno esta roto, esto sucede por que no tienes instalada una
fuente de tipo NerdFont, en mi caso utilizo UbuntuMono Nerd Font y CascadiaCode
podras cambiarlas despues.

```bash
sudo pacman -S ttf-ubuntu-mono-nerdfont ttf-cascadia-code
```

- Reinicio del PC y arreglo de bugs

Despues de esta instalacion deberas hacer un reinicio del pc para poder
observar los cambios, dale un vistazo a los atajos de teclado configurados
en [](), si has echo los pasos bien deberias tener la vista de mi entorno
con el tema que estoy utilizando actualmente.

## Fondo de pantalla

En este punto solo tendras qtile y mis temas configurados
pero supongo que quieres tener un fondo de pantalla para ello
debes tener instalado feh anteriormente en el comando de sotfware
ya lo has instalado si has seguido mis pasos.

De igual manera puedes verificar

```bash
sudo pacman -S feh
```

Para poder definir el fondo de pantalla debes ejecutar el siguiente comando.

```bash
feh --bg-scale /path/to/image.jpg
```

Solo recuerda poner la ruta correcta a tu imagen, pero hay un
problema cuando reinicies la PC se volvera a quitar para hacer
los cambios permanentes deberas de definir un archivo **.xprofile**
en la raiz de tu ordenador, eh echo los deberes por ti y deje preparada
una carpeta con imagenes para fondo de pantalla que te podrian interesar
solo copeala a la raiz de tu PC.

```bash
cp -r ~/dotfiles/wallpapers ~/
```

Ahora para definir tu fondo de pantalla y que este siempre aparezca
al iniciar tu sistema deberas de establecerlo en tu archivo **.xprofile**
puedes guiarte en el mio [.xprofile](./.xprofile).

## Iconos

Si te encuentras en un Portatil incluso en escritorio te podrian
interesar los siguientes iconos.

- Icono de bateria

  Instala el siguiente software y establece el icono de bateria
  en tu archivo **.xprofile** para mantener los cambios.

```bash
sudo pacman -S cbatticon
```

En tu archivo .xprofile

```bash
cbatticon &
```

- Icono de volumen
  De igual forma instala el software y definelo en tu archivo
  .xprofile

```bash
sudo pacman -S volumeicon
```

- Utilidad Wifi
  Es un poco tedioso estar conectandote a Wifi, asi que te dejo esta utilidad

```bash
sudo pacman -S network-manager-applet
```

De igual forma en tu archivo .xprofile

```bash
nm-applet &
```

- Montar USB
  Actualmente si quieres usar un USB lo deberas montar manualmente
  asi que te dejo esta Utilidad

```bash
sudo pacman -S udiskie
```

De igual forma en tu archivo .xprofile

```bash
udiskie -t &
```

## Instalar AUR ( Arch User Repository)

Lo mas probable es que algunos paquetes de software no los
encuentres con el gestor de paquetes pacmna por lo que
la comundidad de Arch Linux cuenta con un sistema de gestor de
paquetes llamado AUR y para instalar software desde aqui deberas
hacer las siguientes instalaciones

```bash

# Verify if you have git installed
sudo pacman -S git

# Clone repository
sudo git clone https:aur.archlinux.org/yay-git.git

# Install yay
sudo chown -R youruser:youruser ./yay-git

cd yay-git

feh --bg-scale wallpapers/forest-violet.jpg &
makepkg -si
```
