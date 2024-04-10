# Arch Installation

Conectarse a internet

```bash
# Promt
iwctl

device list
station wlan0 scan  # El nombre sale del comando anterior
station wlan0 get-networks
station wlan0 connect NOMBRE_ROUTER
exit
timedatectl set-ntp true

# Crear particiones
Ver discos
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
mkfs.vfat -F32 /dev/nmve0n1p4
# Montar particiones
mount /dev/sda5 /mnt
mkdir /mnt/home
mount /dev/sda6 /mnt/home
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

```bash
# Install system
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# System configuration
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
pacman -S nano
nano /etc/locale.gen  # Buscar en_US.UTF-8 UTF-8 y es_ES.UTF-8 UTF-8
locale-gen
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "asus" > /etc/hostname

nano /etc/hosts
127.0.0.1     localhost
::1           localhost
127.0.1.1   	myhostname.localhost	myhostname


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

admin
