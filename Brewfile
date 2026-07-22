# Brewfile - instala tudo com:  brew bundle install --file=Brewfile
#
# Organizado por categoria e comentado com o PORQUÊ de cada item.
# Gerado a partir do meu setup real e curado (removi lixo/experimentos).
# Itens marcados "# opcional" são niche - instale só se precisar.

# ===
#  TAPS (repositórios extras de fórmulas)
# ===
tap "koekeishiya/formulae"      # yabai + skhd - o window manager (o coração do setup)
tap "homebrew/services"         # gerencia daemons: brew services start yabai/skhd/redis…
tap "homebrew/bundle"           # este próprio comando `brew bundle`
tap "mongodb/brew"              # mongodb-community (banco local p/ dev)
tap "heroku/brew"               # opcional - CLI da Heroku

# ===
#  WINDOW MANAGER  →  ver window-manager/
# ===
brew "koekeishiya/formulae/yabai"   # tiling window manager (bsp)
brew "koekeishiya/formulae/skhd"    # hotkey daemon que dispara os comandos do yabai

# ===
#  CLI - navegação & arquivos (substitutos modernos do Unix)
# ===
brew "eza"           # `ls` moderno: ícones, cores, git-aware  → alias ls='eza'
brew "bat"           # `cat` com syntax highlight e paginação
brew "fd"            # `find` simples e rápido
brew "ripgrep"       # `grep` recursivo ultrarrápido (rg)
brew "fzf"           # fuzzy finder - busca interativa em qualquer lista
brew "zoxide"        # `cd` que aprende os diretórios que você visita  → z <parte>
brew "yazi"          # file manager no terminal (preview de imagem, vim-like)
brew "tree"          # árvore de diretórios
brew "ncdu"          # analisador de uso de disco interativo
brew "fastfetch"     # info do sistema bonitinha (sucessor do neofetch)

# ===
#  CLI - dev & git
# ===
brew "git-lfs"           # arquivos grandes no git
brew "git-filter-repo"   # reescrever histórico do git (limpeza)
brew "gh"                # GitHub CLI (PRs, issues, auth)
brew "lazygit"           # UI de git no terminal (add/commit/push visual)
brew "diff-so-fancy"     # diffs de git muito mais legíveis
brew "neovim"            # editor
brew "jq"                # processar/filtrar JSON na linha de comando
brew "tmux"              # multiplexer de terminal → ver multiplexing/
brew "watchman"          # observar mudanças em arquivos (usado por RN/metro)

# ===
#  CLI - linguagens & versionadores
# ===
brew "uv"            # gerenciador de Python/venv ultrarrápido (Astral)
brew "pyenv"         # múltiplas versões de Python
brew "yarn"          # package manager de JS
brew "jupyterlab"    # notebooks

# ===
#  CLI - sistema, rede & mídia
# ===
brew "btop"          # monitor de recursos (top moderno)
brew "blueutil"      # controlar Bluetooth via CLI
brew "wifi-password" # mostrar a senha do wifi conectado
brew "speedtest-cli" # teste de velocidade
brew "ffmpeg-full"   # canivete suíço de áudio/vídeo
brew "imagemagick"   # manipulação de imagem
brew "exiftool"      # ler/editar metadados de mídia
brew "poppler"       # utilitários de PDF (pdftotext, pdfimages…)
brew "yt-dlp"        # baixar vídeos
brew "sevenzip"      # 7z

# --- Bancos de dados (dev local) ---
brew "postgresql@14" # Postgres
brew "libpq"         # cliente do Postgres (psql sem o servidor)
brew "redis"         # cache/fila em memória
brew "mongodb/brew/mongodb-community@6.0"  # MongoDB

# --- Segurança / rede (opcional - niche) ---
brew "wireshark"       # opcional - análise de pacotes
brew "tcpdump"         # opcional - captura de pacotes
brew "proxychains-ng"  # opcional - encadear proxies
brew "tor"             # opcional
brew "pwgen"           # opcional - gerar senhas

# --- Cloud CLIs ---
brew "azure-cli"           # opcional - Azure
brew "mongodb-atlas-cli"   # opcional - MongoDB Atlas

# ===
#  CASKS (apps GUI)  →  ver apps/
# ===
cask "ghostty"                        # terminal (o único que uso) → ver terminal/
cask "raycast"                        # launcher / spotlight turbinado
cask "alt-tab"                        # alt-tab estilo Windows (troca por janela, não por app)
cask "hiddenbar"                      # esconder ícones da menu bar
cask "font-symbols-only-nerd-font"    # ícones (Nerd Font) p/ prompt/terminal/eza

# --- Cloud / dev (opcional) ---
cask "google-cloud-sdk"   # gcloud
cask "ngrok"              # túnel pro localhost
cask "miniforge"         # conda (Python científico)
