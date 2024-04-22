# Arch Installation

Esta es una guia para una instalacion limpia de Arch linux
[Mas Info](https://wiki.archlinux.org/)

- 1. Introduce el archivo ISO Y arrcanca desde el grub

Antes de comenzar deberiamos verificar si tenemos internet

```bash

# Promt
iwctl
device list
station wlan0 get-networks
station wlan0 connect NOMBRE_ROUTER
exit
timedatectl set-ntp true

```

- 2. Particionar los discos

En lo personal me gusta crear las particiones de la siguiente manera

1-. Espacio para el sistema
Tamaño 50G

2-. Swap
Tamaño 8G

3-. Resto del espacio al sistema

En dado caso de no tener la participacion UEFI darle 150mb

```bash
#Listar los  discos
lsblk

#Formatear las particiones
cfdisk

# 50g
mkfs.ext4 /dev/nmve0n1p1

# Resto al sistema
mkfs.ext4 /dev/nmve0n1p3

# 8g Swap
mkswap /dev/nmve0n1p2
swapon /dev/nmve0n1p2

#Formatear la particion UEFI
mkfs.vfat -F32 /dev/nmve0n1p4

# Montar nuestras particiones
mount /dev/sistema /mnt
mkdir /mnt/home
mount /dev/particion/resto /mnt/home
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

- 3.  Instalar Arch Linux

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
127.0.1.1   	myhostname.localhost	myhostname

# Conexion a internet
passwd
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

# Add User
useradd -m usuario
passwd usuario
usermod -aG wheel,audio,video,storage usuario
pacman -S sudo
nano /etc/sudoers # descomentar el  %wheel ALL=(ALL) ALL
exit
umount -R /mnt
shutdown now

# Sacar USB y arrancar PC
```

Bien estos son los comandos basicos para tener una instalacion de Arch linux limpia
pero no tenemos entorno de escritorio puedes instalar alguno popular, crear el tuyo
o copiar mi entorno.

Ahora si has echo una particion para tener Arch junto a windows, por lo que debemos de configurar el grub para
poder arrancar a windows

```bash
sudo pacman -S os-prober

sudo grub-mkconfig -o /boot/grub/grub.cfg
```
