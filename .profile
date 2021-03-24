OS=`uname`

# eval "$(hub alias -s)" # causes zsh git completion issues
alias sv="python -m SimpleHTTPServer"
alias ls="ls -G"
alias homeconfig='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'
alias hc=homeconfig
alias map="xargs -n1" # hat tip Vicent Driessen, https://coderwall.com/p/4tkkpq
alias ip="curl -s ifconfig.co"
alias cwdiff="git diff --no-index --color-words --minimal --ignore-all-space"
alias be="bundle exec"
alias tfl='tail -f log/development.log | grep -vE "(^$|asset|^DEPRE)"'
alias rg="rg --no-heading -g '!*.min.js' --max-columns 200"
# This really wants to be a script that detects grip, the readme name and type
# and does something smart re: browser fallback
alias readme="grip README.md --quiet --export - | browser"
alias filecounts="du -a | cut -d/ -f2 | sort | uniq -c | sort -nr"

if type "nocorrect" > /dev/null;  then
  alias git="nocorrect git"
  alias bower="nocorrect bower"
fi

erhu_mac="00:1e:c9:37:a5:72"
if [ "$OS" = "Darwin" ]; then
  alias wakeerhu="wol $erhu_mac"
  alias pg_start="postgres -D /usr/local/var/postgres"
else
  alias wakeerhu="wakeonlan $erhu_mac"
fi

alias sleeperhu="ssh erhu.local sudo halt -p" # technically this isn't sleeping...

alias sb="subl -n"
alias sba="subl -a"

# very litmus, or at least rails, flavoured...
alias freshen="git checkout master && git pull --recurse-submodules && bundle && rake db:migrate --trace && git checkout db/schema.rb && git checkout - && touch tmp/restart.txt"

alias showdesktop="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop false; killall Finder"

# from building git
alias inflate='ruby -r zlib -e "STDOUT.write Zlib::Inflate.inflate(STDIN.read)"'

# Give this a commit set,
# eg `sbchanged HEAD..master`
# -> open any files that have changes on the current branch
function sbchanged() {
  sba $(git show --name-only --format= $1)
}
# Give this a single commit,
# eg `sbdiffed master`
# -> open any files which differ from master
function sbdiffed() {
  sba $(git diff --name-only --format= $1)
}
# Pipe lines, map to anything we can call on a ruby string
# eg
# ᐅ ls -al | rawk '.split[2]' | sort | uniq      # unique owners in pwd
# rahim
# root
function rawk() {
  ruby -n -e "puts \$_$1"
}

source $HOME/.path
