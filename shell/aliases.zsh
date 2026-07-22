# ~/.config/zsh/aliases.zsh - aliases carregados pelo .zshrc.

# --- CLI moderna no lugar da antiga ---
alias ls='eza'                        # ls com ícones/cores/git
alias ll='eza -la --git --icons'      # listagem detalhada
alias lt='eza --tree --level=2'       # árvore
alias cat='bat'                       # cat com highlight (use `command cat` pro original)

# --- Git ---
alias lg='lazygit'
alias gs='git status'

# --- Utilidades ---
alias reload='source ~/.zshrc'
alias ffetch='fastfetch'
