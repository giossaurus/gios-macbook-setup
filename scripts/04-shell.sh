#!/usr/bin/env bash
# 04-shell - oh-my-zsh + powerlevel10k (instala se faltar).
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# --- oh-my-zsh ---
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ok "oh-my-zsh já instalado"
else
  log "Instalando oh-my-zsh…"
  run 'RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
fi

# --- powerlevel10k ---
if [[ -d "$HOME/powerlevel10k" ]]; then
  ok "powerlevel10k já clonado"
else
  log "Clonando powerlevel10k…"
  run "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \"$HOME/powerlevel10k\""
fi

# --- zsh como shell padrão ---
if [[ "$SHELL" == *"zsh" ]]; then
  ok "zsh já é o shell padrão"
else
  warn "Seu shell não é zsh. Para trocar: chsh -s \$(which zsh)"
fi

ok "Shell pronto. Abra um terminal novo (o .p10k.zsh cuida da aparência do prompt)."
