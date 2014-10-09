set nocompatible             " be iMproved, required
filetype off                 " required

syntax enable
set autoindent
set autoread                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2              " Fix broken backspace in some setups
set backupcopy=yes           " see :help crontab
set clipboard=unnamed        " yank and paste with the system clipboard
set directory-=.             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                " expand tabs to spaces
set ignorecase               " case-insensitive search
set incsearch                " search as you type
set laststatus=2             " always show statusline
set list                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                   " show line numbers
set ruler                    " show where you are
set scrolloff=3              " show context above/below cursorline
set shiftwidth=4             " normal mode indentation commands use 4 spaces
set showcmd
set smartcase                " case-sensitive search if any caps
set softtabstop=4            " insert mode tab and backspace use 4 spaces
set tabstop=8                " actual tabs occupy 8 characters
set wildignore=log/**,node_mo
set wildmenu                 " show a navigable menu for tab completion
set wildmode=longest,list,full
"from https://github.com/zhenlonghe/zhenlong-vimrc/blob/master/gvimrc
set guioptions=ce
set antialias
set linespace=2
if has("gui_running")
    set guifont=Monospace\ 14
    set go=aAce              " 去掉难看的工具栏和滑动条
    "set showtabline=2        " 开启自带的tab栏
    set columns=140          " 设置宽
    set lines=40             " 设置长
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
    "select for copy
    noremap <LeftRelease> "+y<LeftRelease>
endif

"set current dir
"set autochdir

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"nerdtree
Bundle 'scrooloose/nerdtree'
".md, .js
Bundle 'kien/ctrlp.vim'
"search
Bundle 'rking/ag.vim'
"color
Bundle 'flazz/vim-colorschemes'
"vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"below status
Plugin 'Lokaltog/vim-powerline'
"change'a'to[a]
Plugin 'tpope/vim-surround'
"
Bundle 'majutsushi/tagbar'


call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"""NERDTREE
"no file open it
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close with last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Toggle
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
"note bookmark
nmap <F2> :NERDTreeFromBookmark note<CR>:OpenBookmark note<CR>
"chang vim root to nerdtree
let g:NERDTreeChDirMode = 2

"""Ag
nmap <leader>a :Ag 

"""CtrlP
"esc exit
"recent file
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_match_window = 'order:ttb,max:20'

"""colorschemes
set background=dark
colorscheme solarized

"markdown
let g:vim_markdown_folding_disabled=1
"nnoremap <silent> <F5> :exec 'silent !/opt/google/chrome/google-chrome % &'<CR>
nnoremap <silent><F12> :!google-chrome %<CR><CR>

"tagbar
nmap <leader>] :TagbarToggle<CR>

"powerline
set t_Co=16

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
