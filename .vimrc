set nocompatible 
filetype off 

" =============================
" == VUNDLE ===================
" =============================

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


" =============================
" == VIM ======================
" =============================

" UTF-8 Encoding
set encoding=utf-8
set fileencoding=utf-8

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Show line number
set number

" Ignore case in searches 
set ignorecase

" Show last commands
set showcmd

" Highlight all searched words
set hlsearch

" Activating 256 colors for themes
set t_Co=256

" Syntax in different colors
syntax on

" Change colors in different vim modes
set laststatus=2

" Theme
colorscheme monokai 


" =============================
" == CUSTOM MAPPINGS (PT_BR) ==
" =============================

" Just press jj to escape
:imap jj <Esc>

" PT_BR keyboard navegation
noremap ç l
noremap l k
noremap k j
noremap j h

" Code auto ident
:map <c-f> mzgg=G`z"
imap <C-Return> <CR><CR><C-o>k<Tab>

" Linebreak without entering edit mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Open NERDTree by pressing Ctrl+n
map <C-n> :NERDTreeToggle<CR>


" =============================
" == PLUGINS ==================
" =============================

" Better collors
Plugin 'itchyny/lightline.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Surrounds improved - ', ", {, ...
Plugin 'tpope/vim-surround'

" Plugin de autocomplete
Plugin 'valloric/YouCompleteMe'

" =============================
" == SCRIPTS ==================
" =============================

" Close Vim if a file is closed and just NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically open NERDTree if no file is loaded
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
