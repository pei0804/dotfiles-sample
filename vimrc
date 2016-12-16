" ======================
"
"
" vim configuration file
" @author tikasan(https://github.com/tikasan)
"
" README file is here:
"
" suzuken/dotfiles - GitHub
" https://github.com/tikasan/dotfiles
"
" Sorry for writing some comments in Japanese, and I'll translate to English
" later.
" ======================
" Install
" :PlugInstall
" use https://github.com/junegunn/vim-plug
call plug#begin()

"Plugin Installing
Plug 'itchyny/lightline.vim'
Plug 'mattn/webapi-vim'
Plug 'The-NERD-Commenter'
Plug 'mattn/gist-vim'
Plug 'mattn/emmet-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Modeliner'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-quickrun'
Plug 'ShowMarks'
Plug 'mattn/benchvimrc-vim'
Plug 'msanders/snipmate.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'timcharper/textile.vim'
Plug 'Shougo/vimproc.vim'
Plug 'mattn/ctrlp-ghq'
Plug 'majutsushi/tagbar'
Plug 'mattn/sonictemplate-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-dirvish'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Lokaltog/vim-powerline'
Plug 'soramugi/auto-ctags.vim'

" Plugins for each languages
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'wting/rust.vim', {'autoload':{'filetypes':['rust']}}
Plug 'derekwyatt/vim-scala', {'autoload':{'filetypes':['scala']}}
Plug 'vim-ruby/vim-ruby', {'autoload':{'filetypes':['ruby']}}
Plug 'fatih/vim-go', {'autoload':{'filetypes':['go']}}
Plug 'vim-php/tagbar-phpctags.vim', {'autoload':{'filetypes':['php']}}
Plug 'shawncplus/phpcomplete.vim', {'autoload':{'filetypes':['php']}}
Plug 'sumpygump/php-documentor-vim', {'autoload':{'filetypes':['php']}}
Plug '2072/PHP-Indenting-for-VIm', {'autoload':{'filetypes':['php']}}
Plug 'flyinshadow/php_localvarcheck.vim', {'autoload':{'filetypes':['php']}}
Plug 'docteurklein/php-getter-setter.vim', {'autoload':{'filetypes':['php']}}
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'keith/swift.vim', {'autoload':{'filetypes':['swift']}}
Plug 'posva/vim-vue', {'autoload':{'filetypes':['vue']}}
Plug 'othree/csscomplete.vim', {'autoload':{'filetypes':['css']}}
Plug 'gregsexton/MatchTag', {'autoload':{'filetypes':['html']}}
Plug 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
Plug 'hynek/vim-python-pep8-indent', {'autoload':{'filetypes':['python']}}

call plug#end()

if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    BundleInstall
endif

filetype plugin indent on     " required!

" =================
" showmarks_include
" =================
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" =================
" php syntax check
" =================
if executable('vimparse.php')
  setlocal makeprg=vimparse.php\ %\ $*
  setlocal errorformat=%f:%l:%m
  setlocal shellpipe=2>&1\ >
  autocmd BufWritePost <buffer> silent make
endif

" =================
" emmet
" =================
let g:use_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key='<Tab>'
imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\    'indentation' : '  ',
\    'variables': {
\      'lang': "ja"
\    },
\    'javascript' : {
\        'snippets'   : {
\            'jq' : "\\$(function() {\n\t${cursor}${child}\n});"
\        }
\    }
\}

"==========================
" flyinshadow/php_localvarcheck.vim
"==========================
let g:php_localvarcheck_enable = 1
let g:php_localvarcheck_global = 1

"==========================
"init
"==========================
autocmd!
set modelines=5

" leader is ,
let mapleader = ","

set tabstop=4
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab
set number
set title
set scrolloff=5
set ambiwidth=double
set nrformats=

if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif
colorscheme solarized
set background=dark

if v:version >= 700
    set cursorline
endif

set cmdheight=2

" highlight each language in markdown
" http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
\  'css',
\  'go',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'erlang',
\]

if has("gui_gnome")
    set guifont=Ricty\ 12
end

"==========================
"Searching and Moving
"==========================
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault    " always %s/hoge/foo/ means %s/hoge/foo/g
set incsearch
set showmatch
set hlsearch
set wrapscan

" In visual mode, tab means insert <tab> into highlighted block.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Tab move
nnoremap <S-l> gt
nnoremap <S-h> gT

" always escape / and ? in search character.
cnoremap <expr> /
            \ getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?
            \ getcmdtype() == '?' ? '\?' : '?'

"==========================
"Handling long lines
"==========================
set wrap

set formatoptions=qrn1
if v:version >= 730
    set colorcolumn=85 "色づけ
endif

"==========================
"Key Bind
"==========================
" reload vimrc
noremap <C-c><C-c> <C-c>
noremap <C-c><C-e>e :edit $HOME/.vimrc<CR>
noremap <C-c><C-e>s :source $HOME/.vimrc<CR>

" when move to search results, move to center.
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

nnoremap ; :

au FocusLost * :wa

"F2でpasteモードに。pasteするときにインデントを無効化。
" <F2> to paste mode.
set pastetoggle=<F2>

"splitの移動を簡単に。ctrl押しながらhjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Enter> always means inserting line.
nnoremap <S-Enter> O<ESC>
nnoremap <Enter> o<ESC>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yyPVr-jyypVr-
nnoremap <leader>4 yypVr=
nnoremap <leader>5 yypVr-
nnoremap <leader>6 yypVr^
nnoremap <leader>7 yypVr"

"==========================
"language
"==========================
set encoding=utf-8
source $HOME/.vim/vim/encode.vim

set fileformats=unix,dos,mac

set ambiwidth=double

"==========================
"clipboard
"==========================
set clipboard+=autoselect

"==========================
"special Key
"==========================
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
highlight specialKey ctermfg=darkgray

"==========================
"Input
"==========================
set backspace=indent,eol,start
set formatoptions+=mM
set autoindent
set smartindent

"==========================
"Command
"==========================
set wildmenu
set wildmode=full:list

"==========================
"Programming
"==========================
set showmatch "対応する括弧を表示
set foldmethod=syntax
set grepprg=internal "内蔵grep

"==========================
"Backup
"==========================
set autowrite
set hidden
set backup
set backupdir=$HOME/.vimback
set directory=$HOME/.vimtmp
set history=10000
set updatetime=500
"set viminfo=""
let g:svbfre = '.\+'

"==========================
"Status Line
"==========================
set showcmd "ステータスラインにコマンドを表示
set laststatus=2 "ステータスを常に表示

"==========================
"NERDTree
"==========================
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"==========================
"Window
"==========================
set splitright "Window Split時に新Windowを右に表示
set splitbelow "Window Split時に新windowを下に表示

"==========================
"File Type
"==========================
syntax on "シンタックスハイライト

if has('autocmd')
    autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

    autocmd FileType python setl autoindent
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

    autocmd FileType html :compiler tidy
    autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
    autocmd FileType html setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType htm,twig,smarty :set filetype=html

    autocmd BufNewFile,BufRead *.scala set filetype=scala
    autocmd FileType scala setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

    autocmd BufNewFile,BufRead *.q set filetype=sql
    autocmd BufNewFile,BufRead *.twig set filetype=html

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
endif

"==========================
"help
"==========================
set helplang=en

let g:quickrun_config = {}

augroup my_dirvish_events
    au!
    au User DirvishEnter let b:dirvish.showhidden = 1
augroup END

"==========================
"NERDcommenter.vim
"==========================
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
let NERDSpaceDelims = 1
let NERDShutUp = 1
let g:NERDCreateDefaultMappings = 0

" =====================================================
"" snipMate.vim
" =====================================================
let g:snips_author = 'Jumpei Chikamori'

" =====================================================
"" sonictemplate
" =====================================================
let g:sonictemplate_vim_template_dir = [
\ '$HOME/.vim/templates',
\]

" =====================================================
"" cursor
" =====================================================
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" =====================================================
"" dict
" =====================================================
inoremap <C-k> <C-x><C-k>

" =====================================================
"" tagbar
" =====================================================
noremap <leader>t :<c-u>TagbarToggle<cr>

" =====================================================
"" ctrlp.vim
" =====================================================
let g:ctrlp_regexp = 0
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir', 'mixed', 'bookmarkdir']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|class)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" ctrlp-ghq
" https://github.com/mattn/ctrlp-ghq
noremap <leader>g :<c-u>CtrlPGhq<cr>

" jad
" installation required http://varaneckas.com/jad/
augr class
    au!
    au bufreadpost,filereadpost *.class %!jad -noctor -ff -i -p %
    au bufreadpost,filereadpost *.class set readonly
    au bufreadpost,filereadpost *.class set ft=java
    au bufreadpost,filereadpost *.class normal gg=G
    au bufreadpost,filereadpost *.class set nomodified
augr END

"----------------------------------------------------
"" host specific
"----------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^>,;:]*')
  " let s:uri = matchstr(getline("."), '/https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>w :call HandleURI()<CR>

" http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" set full path of current buffer to unamed register
nmap cp :let @" = expand("%")

"----------------------------------------------------
"" lightline
"----------------------------------------------------
let g:Powerline_symbols = 'fancy'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction


"----------------------------------------------------
"" tags
"----------------------------------------------------
set tags=tags
nnoremap tags :!ctags -R<CR>

let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1

" [tag jump] カーソルの単語の定義先にジャンプ（複数候補はリスト表示）
nnoremap tj :exe("tjump ".expand('<cword>'))<CR>

" [tag back] tag stack を戻る -> tp(tag pop)よりもtbの方がしっくりきた
nnoremap tb :pop<CR>
"----------------------------------------------------
"" hjkl
"----------------------------------------------------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
