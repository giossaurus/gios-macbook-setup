#!/usr/bin/env bash
# 03-dotfiles - copia os configs do repo pro ~ (sempre com backup do que existir).
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

log "Copiando dotfiles para o \$HOME (backups em ~/.dotfiles-backup/)…"

# shell
backup_then_copy "$REPO_DIR/shell/zshrc"            "$HOME/.zshrc"
backup_then_copy "$REPO_DIR/shell/zprofile"         "$HOME/.zprofile"
backup_then_copy "$REPO_DIR/shell/aliases.zsh"      "$HOME/.config/zsh/aliases.zsh"
backup_then_copy "$REPO_DIR/shell/p10k.zsh"         "$HOME/.p10k.zsh"

# terminal (Ghostty)
backup_then_copy "$REPO_DIR/terminal/ghostty/config" "$HOME/.config/ghostty/config"
backup_then_copy "$REPO_DIR/terminal/ghostty/themes" "$HOME/.config/ghostty/themes"

# window manager
backup_then_copy "$REPO_DIR/window-manager/yabai/yabairc" "$HOME/.config/yabai/yabairc"
backup_then_copy "$REPO_DIR/window-manager/skhd/skhdrc"   "$HOME/.config/skhd/skhdrc"

# multiplexing
backup_then_copy "$REPO_DIR/multiplexing/tmux.conf"      "$HOME/.tmux.conf"

# git
backup_then_copy "$REPO_DIR/git/gitconfig"          "$HOME/.gitconfig"
backup_then_copy "$REPO_DIR/git/gitignore_global"   "$HOME/.gitignore_global"

echo
warn "Lembrete: crie ~/.zshrc.local para o que é pessoal/secreto (tokens, paths de trabalho)."
ok "Dotfiles copiados."
