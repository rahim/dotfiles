# homeconfig

Selected dotfiles, managed by git without symlinks or a home dir that's a git repository.

For background and information on how to set this up for your own dotfiles see [Sursolid's "Managing home dotfiles with git and github"](http://sursolid.com/managing-home-dotfiles-with-git-and-github) where this approach was shamelessly cribbed from.

In summary: homeconfig is aliased to git, but with the respository data in `~/.homeconfig.git` rather than `~/.git` using a [git worktree](https://git-scm.com/docs/git-worktree)

```
alias homeconfig='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'
```

## Features

* Files live in their native locations (no symbolic linking)
* Home directory is not a git repo
* All the power of git with a simple alias

## Updates

It's just git:

    $ homeconfig pull

## Additions

It's still just git:

    $ homeconfig add .nyanconfig
    $ homeconfig commit -m "Added nyan config"
    $ homeconfig push
    
---

## Personal Environment Setup Notes

Prerequisites:
* zsh
* git

My setup depends on a fork of [Robby Russell's oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for access to my zsh theme:

    $ git clone https://github.com/rahim/oh-my-zsh ~/.oh-my-zsh
    $ chsh -s /bin/zsh

To setup homeconfig itself to manage dotfiles:

    $ cd ~
    $ git clone git@github.com:rahim/homeconfig.git
    $ mv homeconfig/.git .homeconfig.git
    $ shopt -s dotglob
    $ mv -i homeconfig/* .
    $ rmdir homeconfig

Further steps for a personal ruby/vim environment:

* install [rbenv](https://github.com/sstephenson/rbenv/) (ruby/rake is required by janus)

    ```$ git clone git://github.com/sstephenson/rbenv.git ~/.rbenv```

* install [ruby-build](https://github.com/sstephenson/ruby-build)

    ```$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build```

* install a preferred ruby, set it global


    ```$ rbenv install 2.0.0```
    ```$ rbenv global 2.0.0```

* install [janus](https://github.com/carlhuda/janus)

    ```$ curl -Lo- https://bit.ly/janus-bootstrap | bash```
