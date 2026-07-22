# Shell - zsh + oh-my-zsh + powerlevel10k

Meu ambiente de linha de comando: **zsh** como shell, **[oh-my-zsh](https://ohmyz.sh/)** pra
plugins/gestão, e **[powerlevel10k](https://github.com/romkatv/powerlevel10k)** pro prompt (rápido,
com instant-prompt e ícones).

## Arquivos

| Arquivo | Vai pra | O quê |
|---------|---------|-------|
| [`zshrc`](zshrc) | `~/.zshrc` | Config principal (comentada e enxuta) |
| [`zprofile`](zprofile) | `~/.zprofile` | Inicializa o Homebrew no login |
| [`aliases.zsh`](aliases.zsh) | `~/.config/zsh/aliases.zsh` | Aliases (`ls`→`eza`, `cat`→`bat`, `lg`→`lazygit`…) |
| [`p10k.zsh`](p10k.zsh) | `~/.p10k.zsh` | Aparência do prompt (gerado por `p10k configure`) |

## O que está ligado

- **Plugins do omz:** `git` (aliases e status), `web-search` (`google <termo>` no browser),
  `sudo` (aperte `Esc` duas vezes pra prefixar o último comando com `sudo`).
- **fzf** - fuzzy finder. A função `fcd` navega em diretórios com busca interativa; `Alt+C` também.
- **zoxide** - `cd` que aprende: `z proj` te leva pro diretório que você mais visita com "proj".
- **mise** + **nvm** - versionadores de runtime (mise pra várias linguagens; nvm pro Node).

## Configuração pessoal / secreta

O `zshrc` **não** contém nada de máquina-específico ou secreto. Isso vai em `~/.zshrc.local`
(git-ignored), carregado no final. Exemplos do que colocar lá:

```bash
# ~/.zshrc.local
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools"
# conda init, tokens de trabalho, SDKs específicos, gcloud, etc.
```

> Por que separar? Assim o `.zshrc` fica limpo, versionável e público, sem vazar token nem quebrar
> em outra máquina que não tem os mesmos SDKs.

## Limpeza feita (vs. meu `.zshrc` antigo)

O `.zshrc` versionado aqui é uma versão **enxuta** do meu original, que tinha acumulado cruft:
`compinit` chamado duas vezes, `ZSH_THEME="dracula"` competindo com o powerlevel10k que era sourceado
na mão, um `PROMPT=` hardcoded que o p10k sobrescrevia, `pure` instalado sem uso, e vários `export
PATH` de SDKs de máquina. Tudo que é de máquina foi pra `~/.zshrc.local`.

## Instalação

O [`scripts/04-shell.sh`](../scripts/04-shell.sh) instala oh-my-zsh e clona o powerlevel10k;
o [`scripts/03-dotfiles.sh`](../scripts/03-dotfiles.sh) copia os arquivos acima.
