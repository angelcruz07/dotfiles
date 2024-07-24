# Arch Linux - Qtile

Bienvenido si estas leyendo esto es
por que quires aprender a crear tu entorno de escritorio
con Arch Linux.

## Vista previa

Te guiare a tener tu entorno personalizado
con Arch Linux, tratare ser lo mas minimalista
posible para que tu puedas modificarlo a tu gusto.

Si quieres copear directamente mi configuracion ve al final de este documento

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

Para poder iniciar Qtile deberemos tener un manejador de sessiones en mi caso utilizo lightdm, ademas instalaremos
un poco desoftware adicional, terminal, navegador, compositor,
rofi, neofetch, htop.

Puedes observar para que sirve este software en la seccion

1. Instalar software basico

```bash
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter qtile alacritty firefox code rofi neofetch base-devel
pulseaudio pavucontrol feh
```

Con el anterior comando instalaremos el software necesario para que funciones minimamente nuestro sistema operativo pero aun
nos falta mas software por instalar y configurar.

2. Habilitar el login manager
   Para que puedas iniciar sesion en Qtile deberas de habilitarlo
   primero.

```bash
sudo systemctl enable lightdm
```

3. Copear mi configuracion

```bash
cp -r ~/dotfiles/AlexcodeArch/.config ~/
```

4. Instalar fuentes
   Ahora mismo si has reiniciado el PC y te has saltado este paso
   veras que todo el entorno esta roto, esto sucede por que no tienes instalada una fuente de tipo NerdFont, en mi caso
   utilizo UbuntuMono Nerd Font y CascadiaCode podras cambiarlas despues.

```bash
sudo pacman -S ttf-ubuntu-mono-nerdfont ttf-cascadia-code
```

5. Reinicio del PC y arreglo de bugs

Despues de esta instalacion has un reinicio del pc para poder
observar la configuracion, dale un vistazo a los atajos de teclado configurados en [](), si has echo los pasos bien deberias tener la vista de mi entorno con el tema que estoy utilizando
actualmente.

## Extras

Si te encuentras en un portatil es probable que te interese seguir con la siguiente configuracion.

## Brillo

Para poder utilizar las teclas de aumentar o disminuir el Brillo
debes instalar este software. No te preocupes si has copeado mi configuracion ya estan definidas para que las puedas utilizar,
solo asegurate de tener instalado

```bash
sudo pacman -S brightnessctl
```

## Fondo de pantalla

En este punto solo tendras qtile y mis temas configurados
pero supongo que quieres tener un fondo de pantalla para ello
debes tener instalado feh anteriormente en el comando de sotfware ya lo has instalado si has seguido mis pasos.

De igual manera puedes verificar

```bash
sudo pacman -S feh
```

Para poder definir el fondo de pantalla debes ejecutar el siguiente comando.

```bash
feh --bg-scale /path/to/image.jpg
```

Solo recuerda poner la ruta correcta a tu imagen, pero hay un problema cuando reinicies la PC se volvera a quitar para hacer los cambios permanentes deberas de definir un archivo **.xprofile** en la raiz de tu ordenador, eh echo los deberes por ti y deje preparada una carpeta con imagenes para fondo de pantalla que te podrian interesar solo copeala a la raiz de tu PC.

```bash
cp -r ~/dotfiles/wallpapers ~/
```

Ahora para definir tu fondo de pantalla y que este siempre aparezca al iniciar tu sistema deberas de estabrecerlo en tu archivo **.xprofile** puedes guiarte en el mio.

## Iconos

Si te encuentras en un Portatil incluso en escritorio te podrian interesar los siguientes Iconos

1. Icono de bateria
   Instala el siguiente software y establece el icono de bateria
   en tu archivo **.xprofile** para mantener los cambios

```bash
sudo pacman -S cbatticon
```

En tu archivo .xprofile

```bash
cbatticon &
```

2. Icono de volumen
   De igual forma instala el software y definelo en tu archivo
   .xprofile

```bash
sudo pacman -S volumeicon
```

3. Utilidad Wifi
   Es un poco tedioso estar conectandote a Wifi, asi que te dejo esta utilidad

```bash
sudo pacman -S network-manager-applet
```

De igual forma en tu archivo .xprofile

```bash
nm-applet &
```

4. Montar USB
   Actualmente si quieres usar un USB lo deberas montar manualmente
   asi que te dejo esta Utilidad

```bash
sudo pacman -S udiskie
```

De igual forma en tu archivo .xprofile

```bash
udiskie -t &
```
