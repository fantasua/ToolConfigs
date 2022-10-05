set nocompatible

filetype off
set nu
set ruler
syntax on
set hlsearch
set cursorline

" for showing space and tabs
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

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
Plugin 'luochen1990/rainbow'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'airblade/vim-gitgutter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/a.vim'
Plugin 'skywind3000/vim-quickui'
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" end of plugins

" cscope
set cscopetag
set csto=0


" plugins
filetype plugin indent on    " required


" leader key
let mapleader=","

" use space to indent
set tabstop=4
set autoindent

" enable bracket rainbow plugin
let g:rainbow_active = 1

" tag bar config
"uncomment next line when cannot install ctags in $PATH
"let g:tagbar_ctags_bin="$HOME/local/bin/ctags"
let g:tagbar_sort = 0
"control auto open tagbar on file type
"autocmd FileType python,c,cpp TagbarOpen 

" tag file
set tags=./tags,tags;
set autochdir

" NERDTree
let g:NERDTreeChDirMode=3

" for code fold
set foldmethod=syntax
au BufWinLeave ?* silent mkview
au BufWinEnter ?* silent loadview

" tender theme
colorscheme onedark
let g:airline_theme='onedark'

" Gtags config
let $GTAGSLABEL='native-pygments'

" Gutentag configs
" uncomment next line when cannot install ctags in $PATH
let g:gutentags_ctags_executable=g:tagbar_ctags_bin
" use both ctags and gtags
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_ctags_exclude=['*build/*','*.log','.git/*','*cscope*','*.fsdb','*.bin','*SConstruct*','ext','shared_files','liscensingclient']
" ctags extra args
let g:gutentags_ctags_extra_args = ['--fields=+iln', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Gutentag_plus configs
let g:gutentags_plus_switch = 1

" for vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" shortcut keys
" for Tagbar
nnoremap <leader>o :TagbarToggle<CR>
" for NERDTree
nnoremap <leader>e :NERDTreeToggleVCS<CR>

" key mapping changes
map <C-]> g<C-]>

" for debug
" let g:gutentags_define_advanced_commands = 1
