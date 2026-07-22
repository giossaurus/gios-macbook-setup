#!/usr/bin/env bash
# defaults.sh - ajustes de sistema via `defaults write`.
# Foco: DESATIVAR ANIMAÇÕES pra um Mac que responde na hora (ótimo com tiling).
# Rode com:  bash macos/defaults.sh   (ou via scripts/02-macos.sh)
#
# Cada bloco explica o que faz. Pra reverter um ajuste, troque o valor
# (0→1, false→true) ou rode `defaults delete <domain> <chave>`.

set -euo pipefail
echo "==> Aplicando ajustes de macOS…"

# --- Animações globais (NSGlobalDomain / -g) ---
defaults write -g NSScrollViewRubberbanding -int 0            # sem "elástico" ao rolar
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false  # abrir/fechar janela sem animação
defaults write -g NSScrollAnimationEnabled -bool false        # rolagem instantânea
defaults write -g NSWindowResizeTime -float 0.001             # redimensionar janela instantâneo
defaults write -g QLPanelAnimationDuration -float 0           # Quick Look sem animação
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# --- Dock: sem delay e sem animação de auto-hide ---
defaults write com.apple.dock autohide-time-modifier -float 0     # animação de esconder = 0s
defaults write com.apple.dock autohide-delay -float 0             # sem espera pra aparecer
defaults write com.apple.dock expose-animation-duration -float 0  # Mission Control instantâneo
defaults write com.apple.dock springboard-show-duration -float 0  # Launchpad sem animação
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0

# --- Finder & Mail: sem animações ---
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true

# --- Aplicar (reinicia Dock/Finder pra valer imediatamente) ---
killall Dock   2>/dev/null || true
killall Finder 2>/dev/null || true

echo "==> Feito. Alguns ajustes só valem após logout/login."
