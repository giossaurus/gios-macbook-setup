#!/usr/bin/env bash
# 01-brew - instala tudo do Brewfile.
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if ! has brew; then err "Homebrew não encontrado - rode o passo 00 primeiro."; exit 1; fi

log "Instalando pacotes do Brewfile (isso pode demorar)…"
run "brew bundle install --file=\"$REPO_DIR/Brewfile\""
ok "Brewfile aplicado"

log "Verificando o que está faltando (se houver):"
run "brew bundle check --file=\"$REPO_DIR/Brewfile\" || true"
