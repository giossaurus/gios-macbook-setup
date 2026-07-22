# Window Manager - yabai + skhd

O coração do setup, e a parte que a Helena mais gostou. É um **tiling window manager**: as janelas
se organizam sozinhas, sem sobreposição, e você navega e reorganiza tudo pelo teclado.

- **[yabai](https://github.com/koekeishiya/yabai)** - o window manager em si (faz o tiling, gerencia
  spaces e displays).
- **[skhd](https://github.com/koekeishiya/skhd)** - *simple hotkey daemon*: escuta atalhos de teclado
  e dispara comandos do yabai.

## Por que não Rectangle?

Rectangle é ótimo, mas é **manual**: você arrasta/atalha cada janela pra uma metade da tela. O yabai
é **automático** - abriu uma janela, ela já entra no layout (BSP, *binary space partitioning*): a
área se divide em dois a cada janela nova. Você quase nunca posiciona nada na mão; só navega e, quando
quer, troca/gira. Com as animações do macOS desligadas ([`macos/`](../macos/)), é instantâneo.

## Configuração

- [`yabai/yabairc`](yabai/yabairc) - layout `bsp`, `window_gap` e paddings de 12px, foco segue o
  mouse (`mouse_follows_focus`), e `alt` + arrastar move/redimensiona janela. Regras pra **não**
  gerenciar apps que não fazem sentido em tiling (System Settings, Calculator, Karabiner).
- [`skhd/skhdrc`](skhd/skhdrc) - todos os atalhos (tabela abaixo).

O modificador base é **`alt` (⌥)**. Padrão mental:
- **`alt`** = focar / navegar
- **`shift+alt`** = mover / reorganizar
- **`ctrl+alt`** = warp (mover *dentro* da árvore) e controlar o serviço

## ⌨ Atalhos

### Foco (navegar)
| Atalho | Ação |
|--------|------|
| `alt + h / j / k / l` | Focar janela à esquerda / abaixo / acima / direita |
| `alt + s / g` | Focar o display à esquerda / direita |

### Mover & reorganizar
| Atalho | Ação |
|--------|------|
| `shift + alt + h/j/k/l` | **Trocar** (swap) com a janela naquela direção |
| `ctrl + alt + h/j/k/l` | **Warp**: mover a janela pra dentro daquela região (re-split) |
| `shift + alt + s / g` | Mandar a janela pro display à esquerda / direita |
| `shift + alt + p / n` | Mandar a janela pro space anterior / próximo |
| `shift + alt + 1…7` | Mandar a janela pro space nº 1…7 |

### Layout
| Atalho | Ação |
|--------|------|
| `shift + alt + r` | Rotacionar o layout 270° |
| `shift + alt + y` | Espelhar no eixo Y |
| `shift + alt + x` | Espelhar no eixo X |
| `shift + alt + e` | Balancear (todas as janelas ocupam área igual) |
| `shift + alt + t` | Alternar *float* (janela flutuante, centralizada) |
| `shift + alt + m` | Maximizar (zoom fullscreen) |

### Serviço
| Atalho | Ação |
|--------|------|
| `ctrl + alt + q / s / r` | Parar / iniciar / reiniciar o yabai |

> E com o mouse: segure **`alt`** e arraste com o botão esquerdo pra **mover** a janela, ou com o
> direito pra **redimensionar**. Soltar uma janela no centro de outra **troca** as duas.

## Instalação

Via Homebrew (já no [`Brewfile`](../Brewfile)):

```bash
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd
```

Depois rode [`scripts/05-yabai-skhd.sh`](../scripts/05-yabai-skhd.sh), que cuida do scripting
addition e sobe os serviços. Ou manualmente, veja abaixo.

## Scripting Addition (`yabai --load-sa`) - o passo chato

Pra funções avançadas (mover janela entre spaces sem transição, controle fino do Dock), o yabai
injeta um *scripting addition* que precisa de root. Configuração (uma vez só):

**1. Permitir `yabai --load-sa` sem senha** (adiciona uma regra ao sudoers com o hash do binário):

```bash
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
```

**2. Carregar o SA no boot** - adicione ao final do `yabairc`:

```bash
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa
```

**3. Permissões**: System Settings → Privacy & Security → **Accessibility** → habilite `yabai` e `skhd`.

### Se o `--load-sa` falhar (issue [#1231](https://github.com/koekeishiya/yabai/issues/1231))

Em alguns Macs Apple Silicon é preciso habilitar um boot-arg. No **Recovery Mode** (ou com SIP
parcialmente desabilitado), rode e reinicie:

```bash
sudo nvram boot-args=-arm64e_preview_abi
```

> Isso mexe em segurança do sistema. Faça só se as funções avançadas não funcionarem e você
> souber o que está fazendo. O tiling básico funciona sem o SA.

## Referências

- [Guia yabai (text.is)](https://text.is/yabai-guide) - fast switching entre spaces
- [Vídeo tutorial (Erdinç Coşkun)](https://www.youtube.com/watch?v=V8k1GCn2604)
- [Instalar yabai + configurar scripting addition (wiki oficial)](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition)
