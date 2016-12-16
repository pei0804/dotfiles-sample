all: install

install: deps tools vimperator/vimperator-plugins link

vim/autoload/plug.vim:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

deps: vim/autoload/plug.vim

tools:
	go get github.com/peco/peco/cmd/peco
	go get github.com/motemen/ghq
	go get github.com/nsf/gocode

vimperator/vimperator-plugins:
	git clone https://github.com/vimpr/vimperator-plugins.git $@
	ln -s $@/plugin_loader.js vimperator/plugin/

PWD:=$(shell pwd)
srcs:=vimrc vim vimperator vimperatorrc gitconfig vi zshrc tmux.conf
link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/.$(src);)

update-vimperator-plugins:
	cd ./vimperator/vimperator-plugins && git pull origin master


# ----------------------------------------------------
#  tagを生成する
# ----------------------------------------------------

# 言語
# see also `ctags --list-languages`
lang := PHP    \
        Ruby   \
        Python \
        Perl   \
        C

lower_lang := $(shell echo $(lang) | tr A-Z a-z)

# 各言語のtag対象ファイルの拡張子
# see also `ctags --list-maps`
ext := default       \
       .rb.ruby.spec \
       default       \
       default       \
       default

TARGET_PATH  = $(PWD)  # ここは基本的に書き換える
git_toplevel = $(shell cd $(TARGET_PATH);git rev-parse --show-toplevel)
seq          = $(shell seq 1 $(words $(lang)))

ifeq ($(git_toplevel),)
	# gitリポジトリ管理ではない場合
	tags_save_dir = $(realpath $(TARGET_PATH))/tags
	tags_target_dir = $(realpath $(TARGET_PATH))
else
	# gitリポジトリ管理である場合
	tags_save_dir = $(HOME)/dotfiles/tags_files/$(shell basename $(git_toplevel))
	tags_target_dir = $(git_toplevel)
endif

.PHONY: create_tags $(seq)

create_tags: $(seq)

$(seq):
	mkdir -p $(tags_save_dir)
	ctags -R \
		--languages=$(word $@,$(lang)) \
		--langmap=$(word $@,$(lang)):$(word $@,$(ext)) \
-f $(tags_save_dir)/$(word $@,$(lower_lang))_tags $(tags_target_dir)
