# Terminal - Ghostty

[Ghostty](https://ghostty.org/) é o **único** terminal que uso. Nativo em Swift/Metal, truecolor,
rápido, e a config é um arquivo texto simples (nada de UI enterrada em menus).

## Por que Ghostty

- **Rápido** de verdade (GPU) e leve.
- **Truecolor** - as cores dos temas e do syntax highlight aparecem certas (combina com o
  `default-terminal "tmux-256color"` do [tmux](../multiplexing/)).
- Config declarativa em `~/.config/ghostty/config`, versionável.
- Troca de tema **automática** claro/escuro conforme o sistema.

## Arquivos

- [`ghostty/config`](ghostty/config) - config principal (fonte, padding, tema, etc.). É um bom
  ponto de partida; ajuste `font-size` e `theme` ao seu gosto.
- [`ghostty/themes/`](ghostty/themes/) - dois temas custom com a paleta do Cursor:
  - `Cursor Light Real` - fundo claro `#F3F3F3`
  - `Cursor Dark Real` - fundo escuro `#141414`

A linha `theme = light:…,dark:…` no config faz o Ghostty seguir a aparência do macOS.

## Instalação

```bash
brew install --cask ghostty     # já no Brewfile
```

Depois, [`scripts/03-dotfiles.sh`](../scripts/03-dotfiles.sh) copia o `config` e os temas pro
`~/.config/ghostty/`.

## Nota sobre iTerm2 / Kitty

Existem pastas de config desses dois no meu `~/.config` por testes antigos - **não uso mais** e
elas **não fazem parte** deste repo. Só Ghostty.
