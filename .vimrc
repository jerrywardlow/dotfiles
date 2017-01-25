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

" Vagrant syntax highlighting as ruby
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

set mouse=a

" Start NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Force NERDTree to show hidden files
let NERDTreeShowHidden=1

map <F1> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

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

" The NERD tree
Plug 'scrooloose/nerdtree'

call plug#end()

set t_Co=256
silent! colorscheme atom-dark-256
