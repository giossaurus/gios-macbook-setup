#!/usr/bin/env bash
# 05-yabai-skhd - configura o scripting addition do yabai e sobe os serviços.
# Contexto e troubleshooting completo: window-manager/README.md
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if ! has yabai || ! has skhd; then
  err "yabai/skhd não instalados - rode o passo 01 (brew) primeiro."
  exit 1
fi

# --- sudoers: permite `yabai --load-sa` sem senha ---
# Necessário porque o yabai injeta um scripting addition no Dock, que exige root.
SUDOERS_LINE="$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 "$(which yabai)" | cut -d' ' -f1) $(which yabai) --load-sa"
SUDOERS_FILE="/private/etc/sudoers.d/yabai"

log "Configurando sudoers para o yabai --load-sa…"
if [[ "$DRY_RUN" == "1" ]]; then
  printf '   %s[dry-run]%s echo "%s" | sudo tee %s\n' "$C_YELLOW" "$C_RESET" "$SUDOERS_LINE" "$SUDOERS_FILE"
else
  echo "$SUDOERS_LINE" | sudo tee "$SUDOERS_FILE" >/dev/null
  ok "sudoers configurado ($SUDOERS_FILE)"
fi

# --- Subir os serviços ---
log "Iniciando serviços yabai e skhd…"
run "yabai --start-service"
run "skhd  --start-service"

echo
warn "Passos MANUAIS obrigatórios (uma vez só):"
cat <<'EOF'
  1. System Settings → Privacy & Security → Accessibility:
     habilite yabai e skhd.
  2. Se o `yabai --load-sa` falhar (janelas não gerenciadas / borda não aparece),
     pode ser preciso desativar parte do SIP. Veja window-manager/README.md.
  3. Reinicie os serviços depois de dar as permissões:
     yabai --restart-service && skhd --restart-service
EOF
