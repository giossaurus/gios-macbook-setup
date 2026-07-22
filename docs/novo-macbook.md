# Configurando um MacBook novo do zero

Passo-a-passo completo pra sair de um Mac recém-formatado até o meu setup. Você pode rodar tudo de
uma vez com `./install.sh`, ou seguir manualmente pra entender cada parte. Tempo estimado: ~1h
(a maior parte é download).

> **Sempre** rode `./install.sh --dry-run` antes da primeira vez pra ver o que vai acontecer.

---

## 0. Pré-requisitos: Xcode CLT + Homebrew

```bash
xcode-select --install          # ferramentas de compilação (popup do macOS)

# Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Clone este repo:

```bash
git clone https://github.com/giossaurus/gios-macbook-setup.git ~/gios-macbook-setup
cd ~/gios-macbook-setup
```

→ Automatizado em [`scripts/00-preflight.sh`](../scripts/00-preflight.sh).

---

## 1. Instalar tudo via Homebrew

```bash
brew bundle install --file=Brewfile
```

Isso instala CLIs, apps (casks) e o yabai/skhd. Revise o [`Brewfile`](../Brewfile) antes -
está comentado por categoria; comente o que não quiser.

→ [`scripts/01-brew.sh`](../scripts/01-brew.sh). Detalhes: [`cli-tools/`](../cli-tools/), [`apps/`](../apps/).

---

## 2. Login nos apps GUI

Abra e faça login/configuração inicial: **Raycast** (e desabilite o Spotlight no `Cmd+Space`),
**Ghostty**, **Cursor**, **Superhuman**, **BetterDisplay**. Detalhes em [`apps/`](../apps/).

Instale as extensões de browser: [Vimium, Unhook, Freedom](../browser/).

---

## 3. Copiar os dotfiles

```bash
./install.sh 03          # copia zshrc, ghostty, yabai, skhd, tmux, git… (com backup)
```

Cria backup do que já existir em `~/.dotfiles-backup/<timestamp>/`. Depois, crie seu
`~/.zshrc.local` com o que é pessoal/secreto (tokens, SDKs) - veja [`shell/`](../shell/).

→ [`scripts/03-dotfiles.sh`](../scripts/03-dotfiles.sh).

---

## 4. Ajustes do macOS

```bash
./install.sh 02          # desativa animações, ajusta dock/finder
```

→ [`scripts/02-macos.sh`](../scripts/02-macos.sh) · explicação: [`macos/`](../macos/).

---

## 5. Window manager (yabai + skhd) - o passo com mais permissões

```bash
./install.sh 05
```

Depois, **manualmente** (uma vez só):

1. **System Settings → Privacy & Security → Accessibility** → habilite `yabai` e `skhd`.
2. Se funções avançadas falharem, pode precisar do scripting addition / boot-arg - veja o
   troubleshooting completo em [`window-manager/`](../window-manager/).
3. Reinicie: `yabai --restart-service && skhd --restart-service`.

Teste: abra duas janelas - elas devem se dividir sozinhas. Navegue com `alt + h/j/k/l`.
Tabela completa de atalhos em [`window-manager/`](../window-manager/).

---

## 6. Shell (oh-my-zsh + powerlevel10k)

```bash
./install.sh 04          # instala oh-my-zsh + clona powerlevel10k
chsh -s $(which zsh)     # zsh como shell padrão (se ainda não for)
```

Abra um terminal novo. Se quiser recustomizar o prompt: `p10k configure`. Veja [`shell/`](../shell/).

---

## 7. Claude Code + statusbar

```bash
uv tool install claude-statusbar         # o binário `cs`
```

Adicione o bloco `statusLine` ao `~/.claude/settings.json` (veja
[`claude-code/`](../claude-code/)). Dentro do Claude Code, ajuste tema/estilo com `/statusbar-theme`.

---

## 8. Multiplexing / multiagente

O `.tmux.conf` já foi copiado no passo 3. Pra o fluxo de vários agentes em panes, veja
[`multiplexing/`](../multiplexing/). Opcional: instale o [cmux](https://github.com/manaflow-ai/cmux).

---

## Checklist final

- [ ] `brew bundle check --file=Brewfile` sem faltas
- [ ] Ghostty abre com tema Cursor e Nerd Font (ícones aparecem)
- [ ] Prompt do powerlevel10k aparece bonito num terminal novo
- [ ] `ls` mostra ícones (é o `eza`), `z <pasta>` funciona
- [ ] yabai divide janelas automaticamente; `alt+h/j/k/l` navega
- [ ] Raycast no `Cmd+Space`; alt-tab troca por janela
- [ ] Animações do macOS sumiram (janelas abrem instantâneas)
- [ ] Statusbar do Claude Code mostra custo/contexto
- [ ] `~/.zshrc.local` criado com o que é pessoal

Pronto - bem-vindo ao setup.
