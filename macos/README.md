# macOS - ajustes de sistema

Ajustes via `defaults write` que deixam o Mac mais rápido e direto. O foco é **matar as
animações**: com tiling window manager, animação de janela só atrapalha - você quer a janela no
lugar *agora*.

Aplicar tudo:

```bash
bash macos/defaults.sh        # ou: ./install.sh 02
```

## O que muda

| Área | Efeito |
|------|--------|
| **Global (`-g`)** | Abrir/fechar/redimensionar janela e rolagem ficam instantâneos; sem efeito elástico ("rubberbanding") |
| **Dock** | Auto-hide sem delay nem animação; Mission Control e Launchpad instantâneos |
| **Finder / Mail** | Sem animações de UI e de envio/resposta |

Cada linha do [`defaults.sh`](defaults.sh) tem um comentário explicando exatamente o que faz.

## Reverter

Troque o valor (`0`→`1`, `false`→`true`) e rode de novo, ou apague a chave:

```bash
defaults delete -g NSAutomaticWindowAnimationsEnabled
killall Dock Finder
```

Alguns ajustes só valem depois de **logout/login** ou restart.

## Fonte

Baseado no clássico ["Disable macOS animations"](https://apple.stackexchange.com/a/142734).
