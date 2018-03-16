filetype on
syntax on
colorscheme onedark
set lines=35 columns=150
set colorcolumn=90
set number
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=500
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
autocmd BufWritePre * :%s/\s\+$//e