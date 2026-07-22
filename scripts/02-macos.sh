#!/usr/bin/env bash
# 02-macos - aplica os ajustes de sistema (defaults write) de macos/defaults.sh.
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

log "Este passo altera ajustes do macOS (animações, dock, finder…)."
echo "   Detalhes e explicação linha-a-linha: macos/README.md"

if [[ "$DRY_RUN" != "1" ]] && ! confirm "Aplicar os ajustes de macOS agora?"; then
  warn "pulado."
  exit 0
fi

run "bash \"$REPO_DIR/macos/defaults.sh\""
ok "Ajustes aplicados (alguns pedem logout/restart pra valer)."
