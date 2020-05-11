alias o=xdg-open
alias c=cargo

alias tmux="TERM=screen-256color-bce tmux"

alias l=exa
alias ll="exa -l"
alias lll="exa -la"

alias psr=procs

alias dur=dust

alias nv=nvim


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
