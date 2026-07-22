#!/usr/bin/env bash
# lib.sh - helpers compartilhados pelos scripts de setup.
# Não roda sozinho; é carregado com `source` pelos outros scripts.

set -euo pipefail

# --- Cores ---
if [[ -t 1 ]]; then
  C_RESET=$'\033[0m'; C_BLUE=$'\033[34m'; C_GREEN=$'\033[32m'
  C_YELLOW=$'\033[33m'; C_RED=$'\033[31m'; C_BOLD=$'\033[1m'
else
  C_RESET=""; C_BLUE=""; C_GREEN=""; C_YELLOW=""; C_RED=""; C_BOLD=""
fi

# DRY_RUN é exportado pelo install.sh; default = 0 (executa de verdade).
DRY_RUN="${DRY_RUN:-0}"

log()  { printf '%s==>%s %s\n'   "$C_BLUE"   "$C_RESET" "$*"; }
ok()   { printf '%s[ok]%s %s\n'  "$C_GREEN"  "$C_RESET" "$*"; }
warn() { printf '%s[!]%s %s\n'   "$C_YELLOW" "$C_RESET" "$*"; }
err()  { printf '%s[x]%s %s\n'   "$C_RED"    "$C_RESET" "$*" >&2; }
section() { printf '\n%s%s%s\n' "$C_BOLD"  "$*" "$C_RESET"; }

# has <cmd> → verdadeiro se o comando existe no PATH
has() { command -v "$1" >/dev/null 2>&1; }

# confirm "pergunta" → retorna 0 se o usuário responder s/S/yes
confirm() {
  local reply
  read -r -p "$1 [s/N] " reply
  [[ "$reply" =~ ^([sS]|[yY]|sim|yes)$ ]]
}

# run "comando..." → respeita DRY_RUN (só imprime) ou executa
run() {
  if [[ "$DRY_RUN" == "1" ]]; then
    printf '   %s[dry-run]%s %s\n' "$C_YELLOW" "$C_RESET" "$*"
  else
    eval "$@"
  fi
}

# backup_then_copy <src> <dst>
#   Copia src→dst. Se dst já existe e é diferente, faz backup em
#   ~/.dotfiles-backup/<timestamp>/ preservando o nome, antes de sobrescrever.
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
backup_then_copy() {
  local src="$1" dst="$2"
  if [[ ! -e "$src" ]]; then err "fonte não existe: $src"; return 1; fi

  if [[ -e "$dst" ]] && ! diff -q "$src" "$dst" >/dev/null 2>&1; then
    if [[ "$DRY_RUN" == "1" ]]; then
      printf '   %s[dry-run]%s backup %s → %s/ e copiar %s\n' \
        "$C_YELLOW" "$C_RESET" "$dst" "$BACKUP_DIR" "$src"
      return 0
    fi
    mkdir -p "$BACKUP_DIR"
    cp -R "$dst" "$BACKUP_DIR/"
    warn "backup: $dst → $BACKUP_DIR/"
  fi

  run "mkdir -p \"$(dirname "$dst")\""
  run "cp -R \"$src\" \"$dst\""
  ok "$dst"
}
