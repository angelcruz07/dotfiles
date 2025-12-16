# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-23-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/opt/lampp/bin:$PATH"


if [[ $- == *i* ]]; then
    # Commands to run in interactive sessions can go here
fi

export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='gls --color=auto'
fi

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    BREW_BIN="/opt/homebrew/bin"
else
    # Linux
    BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
fi

# Usar la variable BREW_BIN donde se necesite
eval "$($BREW_BIN/brew shellenv)"

source $(dirname $BREW_BIN)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(dirname $BREW_BIN)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(dirname $BREW_BIN)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $(dirname $BREW_BIN)/share/powerlevel10k/powerlevel10k.zsh-theme

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

VM_VAR="$ZELLIJ"
WM_CMd="zellij"

function up_system(){
  local updates count confirm

  # Colores ANSI
  GREEN='\033[1;32m'
  RED='\033[1;31m'
  YELLOW='\033[1;33m'
  CYAN='\033[1;36m'
  RESET='\033[0m'

  updates=$(checkupdates | grep -v '^\s*$')
  count=$(echo "$updates" | grep -c ".")

  if [ "$count" -eq 0 ]; then
    echo "${GREEN}  El sistema ya está actualizado.${RESET}"
    return
  fi

  echo -e "${YELLOW}📦 Hay ${count} actualizaciones disponibles:${RESET}"
  echo -e "${CYAN}$updates${RESET}"
  echo


  echo "$updates"
  echo -n "¿Quieres continuar? (y/n):"

  if [[ "$confirm" =~ ^[yY]$ ]]; then
    echo -e "${GREEN}󱌢 Actualizando sistema...${RESET}"
    sudo pacman -Syu --noconfirm
  else
    echo -e "${RED}❌ Actualización cancelada.${RESET}"
  fi
}

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

function ze() {
  if [ -z "$1" ]; then
    echo "zellij session not exist"
    return 1
  fi
 
  zellij attach "$1"
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# alias
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

alias cat='bat --style=full --paging=never'
alias ls='exa --group-directories-first'
alias tree='exa -T'
alias lg='lazygit'
alias vim='nvim .'
alias apache_start='sudo /opt/lampp/lampp start'
alias apache_restart='sudo /opt/lampp/lampp reload'
alias apache_stop='sudo /opt/lampp/lampp stop'
alias mysql_start='sudo /opt/lampp/lampp startmysql'
alias mysql_stop='sudo /opt/lampp/lampp stopmysql'

#plugins
plugins=(
  command-not-found
)

source $ZSH/oh-my-zsh.sh

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(starship init zsh)"

start_if_needed

# pnpm
export PNPM_HOME="/home/kingdev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/home/kingdev/.deno/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/opt/zen

# bun completions
[ -s "/home/kingdev/.bun/_bun" ] && source "/home/kingdev/.bun/_bun"


# Load Angular CLI autocompletion.
source <(ng completion script)
