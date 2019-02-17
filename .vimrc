set nocompatible              " be iMproved, required
filetype off                  " required


" == CONFIGURAÇÃO DO GERENCIADOR DE PLUGINS - VUNDLE

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
" Call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required




" == CONFIGURAÇÕES DO VIM

" Encoding utf 8
set encoding=utf-8
set fileencoding=utf-8

" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Mostrando nº da linha
set number

" Ignorando case em pesquisas
set ignorecase

" Mostra os comandos executados. Ex: 2yy
set showcmd

" Destaca todos os termos pesquisados. (por default não destaca nenhum)
set hlsearch

" Ativando 256 cores no vim - para os temas
set t_Co=256

" Ativar para mostrar sintaxe em cores diferentes
syntax on

" Ativa a opção de mudar as cores dos modos do vim
set laststatus=2




" == MAPEAMENTOS

" JJ equivale ao esc
:imap jj <Esc>

" Mapeando as teclas PT-br para navegação
noremap ç l
noremap l k
noremap k j
noremap j h

" Identação de código"
:map <c-f> mzgg=G`z"
imap <C-Return> <CR><CR><C-o>k<Tab>

" Quebra de linha sem entrar no insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Abre o NERDTree ao apertar Ctrl+n
map <C-n> :NERDTreeToggle<CR>




" == TEMAS

" Tema de corzinhas bonitinhas - modos do vim
Plugin 'itchyny/lightline.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Surrounds improved - ', ", {, ...
Plugin 'tpope/vim-surround'

" Plugin de autocomplete
Plugin 'valloric/YouCompleteMe'




" TEMA
colorscheme monokai 




" SCRIPTS

"  -NERDTREE

" Fecha o vim se só restou o NERDTree aberto
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Abre o NERDTree automatiamente se nenhum arquivo foi aberto com o vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
