OS=`uname`

# the following isn't always included here on debian
export PATH=/bin:/usr/bin:/sbin/:/usr/sbin:$PATH # to be sure to be sure...

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/bin:$PATH # largely brew binaries
export PATH=/usr/local/share/python:$PATH # pip binaries
export PATH=/usr/local/heroku/bin:$PATH

export HAXEPATH=$HOME/lib/haxe-2.08-osx
export NEKOPATH=$HOME/lib/neko-1.8.2-osx
export PATH=$HAXEPATH:$NEKOPATH:$PATH

export EDITOR=/usr/bin/vim
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

eval "$(rbenv init -)"
# eval "$(hub alias -s)" # causes zsh git completion issues
alias sv="python -m SimpleHTTPServer"
alias ls="ls -G"
alias homeconfig='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'
alias sb="subl -n"
alias sba="subl -a"
alias map="xargs -n1" # hat tip Vicent Driessen, https://coderwall.com/p/4tkkpq

erhu_mac="00:1e:c9:37:a5:72"
if [ "{$OS}" = "Darwin" ] ; then
  alias wakeerhu="wol $erhu_mac"
else
  alias wakeerhu="wakeonlan $erhu_mac"
fi
