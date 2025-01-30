# Arch Installation

Esta es una guia para una instalación limpia de Arch linux.
[Más Info](https://wiki.archlinux.org/)

> [NOTE]
> Si deseas instalar Arch junto a windows deberás
> de tener instalado windows previamente. ya que alrevéz
> no funciona por el momento.

## Arranque

Introduce el archivo ISO previamente cargado en
alguna USB flash y arranca desde el grub.

Antes de comenzar verificamos si tenemos internet.

```bash
iwctl
device list
station wlan0 get-networks
station wlan0 connect NOMBRE_ROUTER
exit

#Veriicar conexión
ping google.com

# Sincronización automatica de la hora
timedatectl set-ntp true
```

## Particionar disco

En lo personal me gusta crear las
particiones de la siguiente manera:

### Comandos

```bash
lsblk

cfdisk /dev/nvme0n1
```

- Espacio para el sistema:
  Tamaño 50G

- Swap:
  Tamaño 8G

- Resto del espacio al sistema:

- Participación UEFI
  Tamaño 150MB

[!NOTE] No olvides crear la particion UEFI

> para evitar problemas al momento
> de instalar el grub de ArchLinux.

## Formatear particiones

Para formatear deberás usar las
particiones que dejaste para el sistema
en el paso anterior.

```bash
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
mount /dev/nvme0n1 /mnt/boot
```

## Instalar Arch Linux

Bien, una vez echas las particiones
podemos proceder a instalar el sistema
en hardware.

```bash
# Install system
pacstrap /mnt base linux linux-firmware base-devel
genfstab -U /mnt >> /mnt/etc/fstab

# System configuration
arch-chroot /mnt

# Zona horaria - Mexico_City
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

# Install nano
pacman -S nano

#Configuración del idioma
nano /etc/locale.gen  # Buscar en_US.UTF-8 UTF-8 y es_ES.UTF-8 UTF-8
locale-gen

echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "yourhostname" > /etc/hostname

# Configuración de los host

nano /etc/hosts
127.0.0.1     localhost
::1           localhost
127.0.1.1     yourhostname.localhost yourhostname

# Conexión a internet - Software
passwd
pacman -S networkmanager
systemctl enable NetworkManager

# Instalación del grub
pacman -S grub efibootmgr dosfstools mtools

# Configurar grub
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
```

Una vez terminado tendremos completada
nuestra instalación de Arch linux.

El siguiente paso seria crear nuestro usuario.

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

## Dual Boot

```bash
sudo pacman -S os-prober

sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Conexión a internet

```bash
nmcli device wifi connect NOMBRE_DE_LA_RED password Contraseña
```

### Posibles errores

Sabemos que Arch Linux en ocasiones
suele ser problematico y puede que tengas errores,
te presentro algunos que he solucionado
espero te puedan servir.

#### Error con el GRUB

Al apagar la computadora para
quitar el USB cuando arrancas
el sistema se va directo a windows
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

## Windows no se detecta en grub

Suele ocurrir que cuando has echo una instalación
junto a windows es posible que no te aparezca windows
en el GRUB.
Esta es mi posible solución para este problema

1. Identificar participación UEFI de windows
   Una vez identificada la debemos de montar en /mnt

2. Ejecutar os-prober

```bash
sudo os-prober
```

En este punto deberia averse agregado windows al grub.
