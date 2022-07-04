set nocompatible
filetype off

" for vundle
set rtp+=~/.vim/bundle/Vundle.vim
" here is the plugins wanted to be included
call vundle#begin() " required

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'jacoborus/tender.vim' " tender theme
Plugin 'joshdick/onedark.vim' " ondark theme
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" end of plugins
" plugins
filetype plugin indent on    " required

set nu
set ruler
syntax on

" leader key
let mapleader=","

" use space to indent
set tabstop=4
set autoindent

"tag bar config
let g:tagbar_ctags_bin='$HOME/ctags/bin/ctags'
autocmd FileType python,c,cpp TagbarOpen

" tag file
set tags=./tags,tags;
set autochdir

" NERDTree
let g:NERDTreeChDirMode=3

" for code fold
set foldmethod=syntax
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

" tender theme
colorscheme onedark
let g:airline_theme='onedark'

" shortcut keys
" for Tagbar
nnoremap <leader>o :TagbarToggle<CR>
" for NERDTree
nnoremap <leader>t :NERDTreeToggleVCS<CR>
