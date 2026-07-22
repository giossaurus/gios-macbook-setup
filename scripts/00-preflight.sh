#!/usr/bin/env bash
# 00-preflight - garante Xcode Command Line Tools + Homebrew.
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# --- Xcode Command Line Tools ---
if xcode-select -p >/dev/null 2>&1; then
  ok "Xcode Command Line Tools já instaladas"
else
  log "Instalando Xcode Command Line Tools (abre um popup do macOS)…"
  run "xcode-select --install"
  warn "Conclua a instalação no popup e rode o setup de novo."
  exit 0
fi

# --- Homebrew ---
if has brew; then
  ok "Homebrew já instalado ($(brew --version | head -1))"
else
  log "Instalando Homebrew…"
  run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  # Em Apple Silicon o brew vive em /opt/homebrew
  run 'eval "$(/opt/homebrew/bin/brew shellenv)"'
fi
