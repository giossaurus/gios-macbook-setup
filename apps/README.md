# Apps (GUI)

Aplicativos de interface gráfica que uso. Os que dá pra instalar via Homebrew estão no
[`Brewfile`](../Brewfile) (`cask "..."`); os demais têm link de download.

## Produtividade / sistema

| App | Por que uso | Instalar |
|-----|-------------|----------|
| **[Raycast](https://www.raycast.com/)** | Launcher turbinado (Spotlight++): clipboard history, snippets, janela, extensões, cálculos. | `brew install --cask raycast` |
| **[BetterDisplay](https://betterdisplay.pro/)** | Controle fino de monitores: resoluções custom, HiDPI, dummy displays, brilho. | Download |
| **[alt-tab](https://alt-tab-macos.netlify.app/)** | Alt+Tab estilo Windows - troca por **janela**, não por app, com preview. | `brew install --cask alt-tab` |
| **[Hidden Bar](https://github.com/dwarvesf/hidden)** | Esconde ícones da menu bar pra deixar limpa. | `brew install --cask hiddenbar` |
| **[Superhuman](https://superhuman.com/mail/)** | Email keyboard-first, rápido. | Download |

## Desenvolvimento

| App | Por que uso | Instalar |
|-----|-------------|----------|
| **[Ghostty](https://ghostty.org/)** | Terminal (o único). Config em [`terminal/`](../terminal/). | `brew install --cask ghostty` |
| **[Cursor](https://cursor.com/download)** | Editor/IDE com IA (fork do VS Code). | Download |
| **[Codex](https://openai.com/index/introducing-the-codex-app/)** | Agente de código da OpenAI. | Download |

## Notas

- **Raycast** substitui o Spotlight - vale desabilitar o atalho `Cmd+Space` do Spotlight em System
  Settings → Keyboard → Keyboard Shortcuts → Spotlight, e apontar o `Cmd+Space` pro Raycast.
- **alt-tab**: nas preferências, dá pra escolher mostrar janelas de todos os spaces, minimizar
  com o próprio atalho, etc. Combina muito com o [yabai](../window-manager/).
