# Git

Config de git e ignore global.

## Arquivos

- [`gitconfig`](gitconfig) → `~/.gitconfig`
- [`gitignore_global`](gitignore_global) → `~/.gitignore_global`

## Destaques

- **Email noreply do GitHub** - os commits usam o email `@users.noreply.github.com`, que mantém
  seu email real privado. Troque pelo *seu* (GitHub → Settings → Emails).
- **`defaultBranch = main`** - novos repos já nascem em `main`.
- **diff-so-fancy** como pager - diffs bem mais legíveis (precisa `brew install diff-so-fancy`,
  já no [`Brewfile`](../Brewfile)).
- **gitignore global** - ignora `.DS_Store`, overrides locais do Claude Code, e lixo de editor em
  *qualquer* repositório, sem sujar o `.gitignore` de cada projeto.

> Antes de commitar este dotfile em público, confira que `name`/`email` são o que você quer expor.
