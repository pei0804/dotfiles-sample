# dotfiles

設定ファイル

## Installation

```
$ make install
```

## Prerequisite

* Your cool PC
* Latest Golang
* vim 7.3+ and buildin python support (for using tern\_for\_vim)

# How to use

zsh
---

Using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

[peco](https://github.com/peco/peco) and [ghq](https://github.com/motemen/ghq) are used for exploring `src` directory with `GOPATH` style.

## Tips

### On zsh,

* `^S`: open any `src` directory by peco. It enables incremental search for projects you fetched.
* `^R`: search .zsh_history in peco.
* [how to](http://qiita.com/itkrt2y/items/0671d1f48e66f21241e2)  

### vim

To install plugins, run `:PlugInstall`.

### Golang

Use [fatih/vim-go: Go development plugin for Vim](https://github.com/fatih/vim-go).

## Vimperator

If you are vim user, [Vimperator][] makes your web browsing faster and easier. Vimperator is an add-ons for firefox.

[Vimperator]: https://addons.mozilla.org/ja/firefox/addon/vimperator/   "Vimperator :: Add-ons for Firefox"

## LICENSE

Public Domain
