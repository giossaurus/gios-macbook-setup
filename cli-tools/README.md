# CLI tools - catálogo comentado

As ferramentas de linha de comando que uso, o que cada uma substitui e **por que**. Todas instalam
via [`Brewfile`](../Brewfile). Filosofia: substitutos modernos das ferramentas antigas do Unix -
mais rápidos, com cor, e com defaults sãos.

## Navegação & arquivos

| Ferramenta | Substitui | Por que uso |
|-----------|-----------|-------------|
| **eza** | `ls` | Ícones, cores, git-aware, `--tree`. Aliasado como `ls`. |
| **bat** | `cat` | Syntax highlight, números de linha, paginação. |
| **fd** | `find` | Sintaxe humana, respeita `.gitignore`, rápido. |
| **ripgrep** (`rg`) | `grep -r` | Busca recursiva ultrarrápida, respeita `.gitignore`. |
| **fzf** | - | Fuzzy finder interativo pra *qualquer* lista (histórico, arquivos, branches). |
| **zoxide** (`z`) | `cd` | Aprende os diretórios que você visita: `z proj` pula direto. |
| **yazi** | Finder | File manager no terminal, vim-like, com preview de imagem. |
| **tree** | - | Árvore de diretórios (a `eza --tree` também faz). |
| **ncdu** | `du` | Uso de disco interativo e navegável. |

## Dev & git

| Ferramenta | Por que uso |
|-----------|-------------|
| **gh** | GitHub pelo terminal: PRs, issues, auth, `gh pr create`. |
| **lazygit** | UI de git no terminal - stage/commit/push/rebase visual e rápido. |
| **diff-so-fancy** | Diffs de git muito mais legíveis. |
| **neovim** | Editor pra edições rápidas no terminal. |
| **jq** | Filtrar/transformar JSON (essencial com APIs). |
| **git-lfs** / **git-filter-repo** | Arquivos grandes / reescrever histórico. |
| **watchman** | Observa mudanças em arquivos (usado por React Native / Metro). |

## Linguagens & runtimes

| Ferramenta | Por que uso |
|-----------|-------------|
| **uv** | Gerenciador de Python/venv da Astral - absurdamente rápido. |
| **pyenv** | Múltiplas versões de Python. |
| **mise** | Version manager poliglota (ativado no `.zshrc`). |
| **nvm** | Versões de Node. |
| **yarn** | Package manager de JS. |
| **jupyterlab** | Notebooks. |

## Sistema, rede & mídia

| Ferramenta | Por que uso |
|-----------|-------------|
| **btop** | Monitor de recursos lindo (CPU/RAM/rede/disco). |
| **fastfetch** | Info do sistema (sucessor do neofetch). |
| **blueutil** | Ligar/desligar Bluetooth via script. |
| **wifi-password** | Mostra a senha do wifi conectado. |
| **speedtest-cli** | Teste de velocidade. |
| **ffmpeg-full** | Converter/cortar/processar áudio e vídeo. |
| **imagemagick** | Redimensionar/converter imagem em lote. |
| **exiftool** | Ler/editar metadados (EXIF) de mídia. |
| **poppler** | Utilitários de PDF (`pdftotext`, `pdfimages`). |
| **yt-dlp** | Baixar vídeos. |
| **sevenzip** | Compactação 7z. |

## Bancos de dados (dev local)

| Ferramenta | Por que uso |
|-----------|-------------|
| **postgresql@14** / **libpq** | Postgres local; `libpq` dá o `psql` sem subir servidor. |
| **redis** | Cache/fila em memória. |
| **mongodb-community@6.0** | MongoDB local. |

## Multiplexers

| Ferramenta | Por que uso |
|-----------|-------------|
| **tmux** | Panes/sessões - base do workflow multiagente. Veja [`multiplexing/`](../multiplexing/). |

## Ferramentas nativas do macOS que uso muito

Não precisam instalar - já vêm no sistema:

- **`pbcopy` / `pbpaste`** - clipboard via pipe (`cat arquivo | pbcopy`).
- **`open`** - abrir arquivo/URL/app (`open .` abre o Finder na pasta atual).
- **`defaults`** - ler/escrever preferências do sistema (veja [`macos/`](../macos/)).
- **`caffeinate`** - impedir o Mac de dormir (`caffeinate -d` durante um build longo).
- **`say`** - TTS (`say "build pronto"` no fim de um comando demorado).
- **`mdfind`** - busca do Spotlight pela linha de comando.
- **`networksetup` / `scutil`** - configurar rede via CLI.
