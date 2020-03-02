# export EDITOR=/usr/bin/nano
alias o=xdg-open
alias c=cargo

alias tmux="TERM=screen-256color-bce tmux"

alias l=exa
alias ls=exa
alias ll="exa -l"
alias lll="exa -la"

alias psr=procs

alias dur=dust

alias nv=nvim

export PATH="$HOME/.cargo/bin:$PATH"
export PATH
export GPG_TTY=$(tty)

# eval "$(starship init zsh)"