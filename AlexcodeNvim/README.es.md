# Nvim

Mi configuración esta basada en este repositorio
[Gentleman Programing](https://github.com/Gentleman-Programming/Gentleman.Dots.git)
con algunos cambios personales, en esta guía podrás
establecer mi configuración.

## Instalación

La configuración esta basada en Lazy Vim
y customizada por lo que es necesario tener
NeoVim y LazyVim instalado.

Consulta la documentación [neovim](https://neovim.io) [lazyvim](http://www.lazyvim.org/installation)

Una vez instaldos NeoVim y LazyVim puedes ejecutar
los siguientes comandos en tu terminal.

### Instalar Home Brew

Este es un administrador de paquetes para macOS y Linux,
te permitirá instalar muchos paquetes y herramientas fácilmente
y siempre está actualizado.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Incluye la ruta de HomeBrew en tu perfil de shell

```bash
# Cambia 'TuNombreDeUsuario' por el nombre de usuario del dispositivo

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/YourUserName/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Ahora necesitamos instalar los paquetes necesarios para
compilar software y algunos complementos

```bash
sudo pacman -Syu

sudo pacman -S base-devel
```

### Instalar nvim

Instalaremos nvim utilizando HomeBrew

```bash
brew install nvim
```

### Instalar Node y NPM

```bash
brew install node
brew install npm
```

### Instalar Git

Necesitamos git para clonar mi repositorio

```bash
brew install git
```

### Instalar fish

```bash
brew install fish
# Establecer como predeterminado:

which fish
# Esto devolverá una ruta, llamémosla whichFishResultingPath

# Agregarlo como un shell disponible
echo whichFishResultingPath | sudo tee -a /etc/shells

# establecerlo como predeterminado
sudo chsh -s wichFishResultingPath
```

### Instalar Oh My Fish

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### Instalar las siguientes dependencias para ejecutar LazyVim

```bash
brew install gcc
brew install fzf
brew install fd
brew install ripgrep
```

### Instalar Zellij

Este es un multiplexor de terminal, te permitirá dividir
tu terminal en múltiples paneles y ejecutar múltiples comandos al mismo tiempo.

```bash
brew install zellij
```

### Clonar mi repositorio

```bash
git clone https://github.com/angelcruz07/dotfiles.git
```

### Copear mi configuracion

Copea mi configuracion del repositorio que acabase de clonar

```bash
cp -r ~/dotfiles/AlexcodeNvim/nvim ~/.config/
```

Hasta este punto tendrás mi configuración
pero aun podemos mejorarlo
puedes seguir con las siguientes isntalaciones.

### Instalar Zsh

```bash
brew install zsh
```

### Instalar Oh My Zsh

```bash
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete
```

### Copear mi zsh

```bash
cp ~/dotfiles/AlexcodeDesktop/.zshrc ~/
```
