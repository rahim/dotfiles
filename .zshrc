# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rahim"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby gem rake extract file-info pip)

# github removed due to hub aliasing completion issues
# see https://github.com/robbyrussell/oh-my-zsh/issues/766
# rbenv removed as we want to handle $PATH precedence manually in .path

source $ZSH/oh-my-zsh.sh

# override our theme's prompt if koto
function prompt_hostname() {
  if [[ $HOST = *kora* ]] || [[ $HOST = *fiddle* ]]; then
    #do nothing
  else
    [ -n "$HOST" ] && echo "$HOST:"
  fi
}

# avoid corrections for sudo
# (misbehaves in home dir with eg sudo vim and .vim)
alias sudo="nocorrect sudo"

source $HOME/.less_termcap

which kubectl >/dev/null && source <(kubectl completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $HOST =~ ^litmus-dev ]] && [ -d ~/litmus ]; then
  cd litmus
fi
