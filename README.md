# gios-macbook-setup

> Meus dotfiles e o passo-a-passo pra configurar um MacBook novo do zero - do jeito que eu uso o Mac.

Isto é ao mesmo tempo **backup dos meus configs**, **documentação do porquê de cada escolha** e um
**tutorial reproduzível**. Se você é a Helena (ou qualquer pessoa curiosa ): comece por aqui, leia
os READMEs de cada pasta, e rode só o que fizer sentido pra você.

## Filosofia

Keyboard-first, sem tocar no mouse quando dá. Janelas em **tiling automático** (yabai + skhd),
terminal rápido e nativo (**Ghostty**), **CLI moderna** no lugar das ferramentas antigas do Unix
(`eza`, `bat`, `fd`, `ripgrep`, `zoxide`…), e um fluxo **multiagente** com tmux/cmux pra rodar
vários agentes de IA lado a lado.

## Índice

| Pasta | O que tem |
|-------|-----------|
| [`window-manager/`](window-manager/) | **yabai + skhd** - tiling automático, tabela de atalhos, setup do scripting addition |
| [`terminal/`](terminal/) | **Ghostty** - configuração e temas Cursor Light/Dark |
| [`shell/`](shell/) | **zsh + oh-my-zsh + powerlevel10k** - prompt, aliases, fzf/zoxide |
| [`multiplexing/`](multiplexing/) | **tmux + cmux** - o workflow multiagente |
| [`cli-tools/`](cli-tools/) | Catálogo comentado das ferramentas de linha de comando (o quê e por quê) |
| [`claude-code/`](claude-code/) | Claude Code: statusbar `cs`, skills, settings |
| [`apps/`](apps/) | Apps GUI (Raycast, BetterDisplay, Cursor, Superhuman…) |
| [`browser/`](browser/) | Extensões de navegador (Vimium, Unhook, Freedom) |
| [`macos/`](macos/) | `defaults write` - desativar animações e ajustes de sistema |
| [`git/`](git/) | Config de git e gitignore global |
| [`docs/novo-macbook.md`](docs/novo-macbook.md) | **O tutorial completo, do zero** |

## Quick start

```bash
git clone https://github.com/giossaurus/gios-macbook-setup.git
cd gios-macbook-setup

# 1. Sempre veja o que os scripts fariam ANTES de rodar de verdade:
./install.sh --dry-run

# 2. Rodar de verdade (pede confirmação nos passos destrutivos):
./install.sh
```

Ou rode passos isolados: `scripts/01-brew.sh`, `scripts/02-macos.sh`, etc. Veja
[`docs/novo-macbook.md`](docs/novo-macbook.md) pro passo-a-passo manual e comentado.

## Aviso

Estes são **os meus** dotfiles. Leia antes de rodar - alguns scripts sobrescrevem configs no seu
`~` (sempre com backup em `~/.dotfiles-backup/<timestamp>/`) e mudam ajustes do macOS.

**Nenhum segredo está neste repositório.** Tokens, chaves, `.netrc`, credenciais de cloud etc.
ficam de fora via [`.gitignore`](.gitignore). Onde um config precisa de algo pessoal, use um arquivo
`*.local` (ignorado pelo git).
