# Claude Code

Como eu configuro o [Claude Code](https://claude.com/claude-code) - em especial a **statusbar** que
mostra consumo/custo em tempo real, e o workflow multiagente.

## Statusbar (`cs` / claude-statusbar)

A barra de status na base do Claude Code mostrando **custo da sessão, uso do contexto, idade do
prompt-cache, duração, tools ativas, subagentes rodando** e mais. É a [claude-statusbar](https://github.com/) (`cs`), instalada como ferramenta `uv`.

### Instalar

```bash
uv tool install claude-statusbar      # instala o binário `cs`
cs --help                             # temas, estilos, doctor…
```

### Ligar no Claude Code

Adicione ao seu `~/.claude/settings.json` o bloco de [`settings.example.json`](settings.example.json):

```json
"statusLine": {
  "type": "command",
  "command": "/Users/SEU_USUARIO/.local/bin/cs render",
  "refreshInterval": 1
}
```

> Ache o caminho do `cs` com `which cs` e troque `SEU_USUARIO`.

### Customizar

Dentro do Claude Code use os comandos da skill: `/statusbar` (ver config), `/statusbar-theme`
(graphite/twilight/linen), `/statusbar-style` (classic/capsule/hairline), `/statusbar-doctor`
(diagnosticar), `/statusbar-preview` (ver todas as combinações). Dá pra mostrar/esconder segmentos
(todos, tool ativa, subagentes, duração, linhas alteradas, git ahead/behind) e ligar o *forecast*
de quanto ainda dá pra usar na janela.

## Workflow multiagente

Rodar vários Claude/agentes em paralelo, um por pane do tmux, com o título do pane identificando
cada um. O setup do tmux está em [`multiplexing/`](../multiplexing/).

## O que NÃO versionar

- **`~/.claude/settings.json` inteiro** - tem estado/config sensível. Versione só o *trecho* da
  statusline (como no `settings.example.json`).
- **`~/.claude.json`** e `~/.claude/settings.local.json` - dados da conta/projeto. Já bloqueados
  no [`.gitignore`](../.gitignore).
