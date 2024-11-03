export ZSH="$HOME/.oh-my-zsh"
plugins=(git vi-mode vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/.volta/bin
export PATH=$PATH:$HOME/.volta/tools/image/packages
export PATH=$PATH:$HOME/.local/bin
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin



export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(starship init zsh)"
