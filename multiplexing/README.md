# Multiplexing - tmux + cmux (workflow multiagente)

Como eu rodo **vários agentes de IA lado a lado** num terminal só. Cada agente (Claude Code, Codex,
etc.) vive num *pane*, com o título do pane mostrando quem é quem.

## tmux - panes por agente

O [`tmux.conf`](tmux.conf) é enxuto e focado nesse fluxo:

| Config | Por quê |
|--------|---------|
| `default-terminal "tmux-256color"` + overrides `Tc` | Truecolor de verdade dentro do Ghostty |
| `pane-border-status top` + `pane-border-format` | **Mostra o título de cada pane na borda** - é assim que você sabe qual agente está onde |
| `mouse on` | Clicar pra trocar de pane, arrastar bordas pra redimensionar, scroll funciona |
| `history-limit 50000` | Output longo de agente não some |
| `base-index 1` / `pane-base-index 1` | Panes/janelas começam no `1` (mais perto no teclado que `0`) |
| `prefix + r` | Recarrega o `~/.tmux.conf` na hora |

> O prefixo padrão do tmux é **`Ctrl+b`**. Onde eu escrevo "prefix", é ele.

### Setup rápido de uma sessão multiagente

```bash
tmux new -s agentes          # cria a sessão

# dentro do tmux (prefix = Ctrl+b):
#   prefix "     → divide o pane na horizontal (um em cima do outro)
#   prefix %     → divide o pane na vertical (lado a lado)
#   prefix ←↑↓→  → navega entre panes
#   prefix z     → zoom (foca 1 pane em tela cheia; de novo pra voltar)

# dê um nome a cada pane pra aparecer na borda:
printf '\033]2;claude-backend\033\\'   # renomeia o pane atual → "claude-backend"
```

Aí é só rodar um agente diferente em cada pane (`claude` num, `codex` noutro, um `npm run dev`
num terceiro) e acompanhar todos de uma vez. O título na borda mantém tudo legível.

## cmux - orquestrador visual de agentes

[cmux](https://github.com/manaflow-ai/cmux) é um app que faz esse mesmo tipo de orquestração de
múltiplos agentes com uma UI própria (workspaces, fork de conversas, viewer de markdown), em vez
de só panes de terminal. Uso quando quero uma visão mais "de janelas" do que de panes.

O [`cmux/cmux.json`](cmux/cmux.json) aqui é o **template comentado** (JSONC) - todas as opções vêm
comentadas; descomente só o que quiser fixar em arquivo. Sem segredos.

## Instalação

```bash
brew install tmux            # já está no Brewfile
# cmux: baixe em https://github.com/manaflow-ai/cmux
```
