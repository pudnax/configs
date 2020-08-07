alias o=xdg-open
alias c=cargo

alias tmux="TERM=screen-256color-bce tmux"

export EDITOR="vim -i"

alias l=exa
alias ll="exa -l"
alias lll="exa -la"

alias psr=procs

alias dur=dust

alias nv=nvim

export JAVA_HOME="/usr/lib/jvm/default/"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opam configuration
test -r /home/koms/.opam/opam-init/init.zsh && . /home/koms/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
