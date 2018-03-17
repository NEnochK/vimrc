"Enable syntax highlighting
filetype on
syntax on

"Colors
set background=dark
colorscheme onedark

"Window size when vim opens
set lines=35 columns=150
set colorcolumn=90

"Show Line numbers
set number

"Change leader keybinding
let mapleader=" "

"map <leader> + s to reload the .vimrc configuration
map <leader>s :source ~/.vimrc<CR>
set hidden

"Number of changes in history vim has to remember
set history=500

filetype indent on

"Visually wraps words
set wrap
set linebreak

"Setting width of tabs to 2 and other misc. tab/indent settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

"Highlight when searching
set hlsearch

"Cancel search with esc key
noremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>

"Show matching parens
set showmatch

"Remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

"Always display the status line (esp for the LightLine plugin)
set laststatus=2

"Doesn't display the vanilla status line (non LightLine status line)
set noshowmode

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')

"Opens NERDTree on vim open but focuses on the vim window
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

"Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Ignore certain files in NERDTree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"Toggle NERDTree when pressing ctrl+n
map <C-n> :NERDTreeToggle<CR>

"Have NERDTree also display hidden files
let NERDTreeShowHidden=1

" Settings for LightLine
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"Automatically installs vim-plugin if it isn't installed already (mainly for
"new machines
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Install plugins when :PlugInstall is called
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
call plug#end()

