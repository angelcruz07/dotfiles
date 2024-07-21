# Dotfiles y configuracion

## Resumen

Esta es un guia que te llevara a crear un entorno de escritorio personalizado
con Arch Linux. En este caso voy a asumir que estas familizarizado con sistemas
operativos basados en Linux y sus lineas de comandos, ademas de eso deberias
tener un poco de conocimiento sobre que son los "tiling window manager"
ya que en este caso mi configuracion esta basada en Qtile ya que este
se encuentra escrito en python y es muy facil de configurar.

Esto es un poco del camino que yo e tomado en este mundo de
los sistemas operativos y la magia de Arch Linux.

## Inicio de sesion y gestor de ventanas

Primero necesitamos de una manera de iniciar sesion y abrir porgramas
como editores de codigo, navegadores o terminales para esto esteremos
utilizando [lighdm](https://wiki.archlinux.org/title/LightDM) y
[qtile](https://wiki.archlinux.org/title/Qtile) lightdm no funcionara si
no tienes un [gretter](https://wiki.archlinux.org/title/LightDM#Greeter)
al igual necesitaremos de una terminal en mi caso yo utilizo [alacritty](https://alacritty.org/)
de igual manera ocuparemos de un editor de texto puedes utilizar [vscode](https://code.visualstudio.com/)
o [nvim](https://neovim.io/) si tienes experiencia previa, si no de lo
contrario no lo recomiendo por ultimo ocupamos de un navegador.

Para instalar el software mencionado usaremos los siguientes comandos

```bash
sudo pacman -S lightdm lightdm-gtk-greeter qtile xterm code firefox
```

Activa el servicio de lightdm y reinicia el ordenador, deberias poder iniciar
sesion en Qtile a travez de lightdm

```bash
sudo systemctl enable lightdm
reboot
```

## Configuracion basica de qtile

| Atajo                | Acción                              |
| -------------------- | ----------------------------------- |
| **mod + enter**      | abrir xterm                         |
| **mod + k**          | ventana siguiente                   |
| **mod + j**          | ventana anterior                    |
| **mod + w**          | cerrar ventana                      |
| **mod + [12345678]** | ir al espacio de trabajo [12345678] |
| **mod + ctrl + r**   | reiniciar qtile                     |
| **mod + ctrl + q**   | cerrar sesión                       |

Antes de continuar si tu distribucion del teclado no se encuentra en ingles
deberias cambiarla, abre **alacritty** con **mod + enter** la tecla mod
es la tecla con el icono de windows en tu teclado

```bash
setxkbmap es
```

Ten en cuenta que este cambio no es permanente, si reinicias el PC tendras que escribir
el comando anterios de nuevo.

Por defecto no hay menu para iniciar programas, actualmente solo
lo puedes hacer a travez de alacritty.

En mi caso utilizo el menu [rofi](https://wiki.archlinux.org/title/Rofi)
pero puedes utilizar [dmenu](https://wiki.archlinux.org/title/Dmenu)

```bash
sudo pacman -S rofi
```

Bien ahora tendremos que agregar algunos atajos de teclados
para esto abre el archivo de configuracion con tu editor
de texto elegido y dirigete al archivo de configuracion de
qtile

```bash
nvim .config/qtile/config.py
```

En este fichero agregaremos lo siguientes atajos de teclado

```bash
Key([mod], "m", lazy.spawn("rofi -show run")),
Key([mod, 'shift'], "m", lazy.spawn("rofi -show")),
```

Reinicia Qtile con mod + control + r. Deberías poder abrir el
menú y el emulador de terminal usando los atajos de teclado
que acabas de definir. Si has instalado rofi, puedes cambiar su tema:

```bash
sudo pacman -S which
rofi-theme-selector
```

## Utilidades basicas de sistema
