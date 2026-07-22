#!/usr/bin/env bash
# install.sh - orquestrador do setup. Roda os scripts de scripts/ na ordem.
#
# Uso:
#   ./install.sh --dry-run     # só mostra o que faria (recomendado na 1ª vez)
#   ./install.sh               # executa de verdade (pede confirmação nos passos destrutivos)
#   ./install.sh 03 04         # roda só os passos 03 e 04
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export REPO_DIR
source "$REPO_DIR/scripts/lib.sh"

# --- Parse de argumentos ---
export DRY_RUN=0
STEPS=()
for arg in "$@"; do
  case "$arg" in
    --dry-run|-n) DRY_RUN=1 ;;
    --help|-h)
      grep '^#' "$0" | sed 's/^# \{0,1\}//' | head -12; exit 0 ;;
    [0-9][0-9]) STEPS+=("$arg") ;;
    *) err "argumento desconhecido: $arg"; exit 1 ;;
  esac
done

ALL_STEPS=(00-preflight 01-brew 02-macos 03-dotfiles 04-shell 05-yabai-skhd)

section " gios-macbook-setup"
[[ "$DRY_RUN" == "1" ]] && warn "MODO DRY-RUN - nada será alterado."
echo "Repositório: $REPO_DIR"

for step in "${ALL_STEPS[@]}"; do
  num="${step%%-*}"
  # Se o usuário passou passos específicos, pula os que não foram pedidos.
  if [[ ${#STEPS[@]} -gt 0 ]] && ! printf '%s\n' "${STEPS[@]}" | grep -qx "$num"; then
    continue
  fi
  script="$REPO_DIR/scripts/$step.sh"
  [[ -f "$script" ]] || { warn "pulando $step (script não existe ainda)"; continue; }
  section "--- Passo $step ---"
  bash "$script"
done

section "Concluído."
[[ "$DRY_RUN" == "1" ]] && echo "Rode sem --dry-run para aplicar de verdade."
echo "Backups (se houver) ficam em ~/.dotfiles-backup/"
