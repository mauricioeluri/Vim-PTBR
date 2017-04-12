colorscheme torte
set tabstop=4
set number
set ignorecase
set autoindent
set showcmd
set hlsearch
set ignorecase
syntax on
set <F7>=<C-v><F7>
map <F7> mzgg=G`z
imap <C-Return> <CR><CR><C-o>k<Tab>
:imap jj <Esc>
noremap ç l
noremap l k
noremap k j
noremap j h

"Quebra de linha sem entrar no insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

execute pathogen#infect()
call pathogen#helptags()
