# Arch Installation

Esta es una guia para una instalacion limpia de Arch linux.
[Mas Info](https://wiki.archlinux.org/)

> [NOTE]
> Si deseas instalar Arch junto a linux deberas de crear primero una particion para
> el sistema desde windows y despues podras seguir con la instalacion de Arch.

- 1. Introduce el archivo ISO Y arrcanca desde el grub

Antes de comenzar deberiamos verificar si tenemos internet

```bash

# Promt
iwctl
device list
station wlan0 get-networks
station wlan0 connect NOMBRE_ROUTER
exit

#Veriicar conexion
ping google.com

# Sincronizacion automatica de la hora
timedatectl set-ntp true

```

1. Particionar los discos

En lo personal me gusta crear las particiones de la siguiente manera

1. Espacio para el sistema
   Tamaño 50G

2. Swap
   Tamaño 8G

3. Resto del espacio al sistema

4. Participacion UEFI darle 150mb

## Formatear particiones

```bash
#Listar los  discos
lsblk

#Formatear las particiones

# En mi caso necesito hacer
cfdisk /dev/nvme0n1

# 50g
mkfs.ext4 /dev/nmve0n1p1

# Resto al sistema
mkfs.ext4 /dev/nmve0n1p3

# 8g Swap
mkswap /dev/nmve0n1p2
swapon /dev/nmve0n1p2

#Formatear la particion UEFI
mkfs.vfat -F32 /dev/nmve0n1p4
```

## Montar nuestras particiones

```bash
#1
mount /dev/particiona-del-sistema /mnt

#2
mkdir /mnt/home
mount /dev/particion/resto /mnt/home

#3
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

## Instalar Arch Linux

Bien una vez echas las particiones podemos proceder a instalar el sistema en software.

```bash
# Install system
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# System configuration
arch-chroot /mnt

# Zona horaria
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

# Install nano
pacman -S nano
nano /etc/locale.gen  # Buscar en_US.UTF-8 UTF-8 y es_ES.UTF-8 UTF-8
locale-gen

echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "asus" > /etc/hostname

# Configuracion de los host
nano /etc/hosts
127.0.0.1     localhost
::1           localhost
127.0.1.1    myhostname.localhost myhostname

# Conexion a internet
passwd
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S grub efibootmgr

# configurar grub
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
```

Con lo anterior debemos tener completada nuestra instalacion de Arch linux
el siguiente paso seria crear nuestro usuario.

```bash
# Add User
useradd -m usuario
passwd usuario
usermod -aG wheel,audio,video,storage usuario
pacman -S sudo
nano /etc/sudoers # descomentar el  %wheel ALL=(ALL) ALL
exit
umount -R /mnt
# Despues del proximo comando sacar USB y arrancar PC
shutdown now
```

Bien estos son los comandos basicos para tener una instalacion de Arch linux limpia
pero no tenemos entorno de escritorio puedes instalar alguno popular, crear el tuyo
o copiar mi entorno.

Ahora si has elegido crear un DualBoot para tener Arch junto a windows, por lo que debemos de configurar el grub para
poder arrancar a windows.

```bash
sudo pacman -S os-prober

sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Posibles errores

Sabemos que Arch Linux en ocasiones suele ser problematico y puede que tengas errores,
te presentro algunos que he solucionado espero te puedan servir.

Error con el GRUB

Al apagar la computadora para quitar el USB cuando arrancas el sistema se va directo a windows
sin pasar por el grub de Arch.

Este error lo e solucionado haciendo lo siguiente:

Desde el simbolo del sistema en en modo administrador ejecutar el siguiente comando

```bash
bcdedit /set {bootmrg} path \EFI\arch\grubx64.efi
```

Debes tener cuidado ya que si no poner el comando de la manera
correcta no podras iniciar ni en windows ni en Arch Linux

Bien pero alto ahi podras entrar a Arch Linux pero muy probablemente
no te saldra la opcion en el grub para iniciar en windows por lo que
necesitas en paso siguiente.

```bash
#Reemplaza /dev/sdX con el disco correcto (por ejemplo, /dev/sda) y Y con el número de partición correcto (por ejemplo, 1).
sudo efibootmgr -c -d /dev/sdX -p Y -L "Windows Boot Manager" -l "\EFI\Microsoft\Boot\bootmgfw.efi"

```
