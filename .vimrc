syntax on
colorscheme atom-dark-256
set t_Co=256
set showcmd
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set modeline
set number
set hidden
set scrolloff=4
autocmd FileType puppet,ruby,yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Start of vim-plug stuff
call plug#begin('~/.vim/plugged')

" GitGutter
Plug 'airblade/vim-gitgutter'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Fugitive
Plug 'tpope/vim-fugitive'

call plug#end()
