set nocompatible
filetype off

" for vundle
set rtp+=~/.vim/bundle/Vundle.vim
" here is the plugins wanted to be included
call vundle#begin() " required

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'jacoborus/tender.vim' " tender theme

" All of your Plugins must be added before the following line
call vundle#end()            " required
" end of plugins
" plugins
filetype plugin indent on    " required

set nu
set ruler
syntax on

" use space to indent
set tabstop=4
set autoindent

"tag bar config
let g:tagbar_ctags_bin='$HOME/ctags/bin/ctags'

" tag file
set tags=./tags,tags;
set autochdir

" leader key
let mapleader=","

" tender theme
colorscheme tender
let g:airline_theme='tender' 
