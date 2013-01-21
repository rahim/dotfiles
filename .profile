export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/bin:$PATH # largely brew binaries
export PATH=/usr/local/share/python:$PATH # pip binaries
export PATH=/usr/local/heroku/bin:$PATH

export HAXEPATH=$HOME/lib/haxe-2.08-osx
export NEKOPATH=$HOME/lib/neko-1.8.2-osx
export PATH=$HAXEPATH:$NEKOPATH:$PATH

export EDITOR=/usr/local/bin/mvim
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

eval "$(rbenv init -)"
# eval "$(hub alias -s)" # causes zsh git completion issues
alias sv="python -m SimpleHTTPServer"
alias ls="ls -G"
alias homeconfig='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'
alias sb="subl -n"
alias sba="subl -a"
