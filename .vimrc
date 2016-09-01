syntax on
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

" Atom-Dark colorscheme
Plug 'gosukiwi/vim-atom-dark'

" Hashivim Terraform
Plug 'hashivim/vim-terraform'

call plug#end()

set t_Co=256
colorscheme atom-dark-256
