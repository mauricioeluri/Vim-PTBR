set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)

" Plugin 'file:///home/m4/.vim/bundle/sparkup'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'skammer/vim-css-color'
Plugin 'mattn/emmet-vim'
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"colorscheme torte
"colorscheme wombat256

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

set modifiable
set tabstop=4
set number
set ignorecase
set autoindent
set showcmd
set hlsearch
set ignorecase
set t_Co=256
syntax on

"Identação de código"
:map <c-f> mzgg=G`z"

imap <C-Return> <CR><CR><C-o>k<Tab>
:imap jj <Esc>
noremap ç l
noremap l k
noremap k j
noremap j h

"Quebra de linha sem entrar no insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"execute pathogen#infect()
"call pathogen#helptags()

set laststatus=2







"set nocompatible
"" format
"set autoindent
" set backup
" set nu
" set smartindent
" set showmatch
" set textwidth=80
" set title
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
" " syntax
" syntax on
" " support 256 colors in Lion terminal 
" set t_Co=256
" " files 
" filetype on
" filetype indent on
" filetype plugin on
" " always show file name
" set modeline
" set ls=2
" " colorscheme
" colorscheme molokai

colorscheme monokai 
