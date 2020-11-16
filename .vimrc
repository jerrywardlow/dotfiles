syntax on
set showcmd
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set modeline
set number
set numberwidth=3
set hidden
set scrolloff=4
set pastetoggle=<F2>
set noswapfile
set ignorecase
set smartcase
set incsearch
set ruler
set exrc
set secure
set backspace=indent,eol,start
set list
set listchars=tab:T>,trail:~

map Q <nop>

cmap w!! w !sudo tee % >/dev/null

autocmd FileType puppet,yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Vagrant syntax highlighting as ruby
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" Start NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Force NERDTree to show hidden files
let NERDTreeShowHidden=1

" NERDTree ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

" NERDTree Minimal UI
let NERDTreeMinimalUI=1

map <F2> :NERDTreeToggle<CR>
map <F3> :set invnumber<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Easier split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Vim Polyglot
Plug 'sheerun/vim-polyglot'

" The NERD tree
Plug 'scrooloose/nerdtree'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Salt
Plug 'saltstack/salt-vim'

" GPG
Plug 'jamessan/vim-gnupg'

" YAML folds
Plug 'pedrohdz/vim-yaml-folds'

call plug#end()

" Template syntax highlighting as sh
autocmd BufRead,BufNewFile *.template set syntax=sh

set t_Co=256
silent! colorscheme atom-dark-256
highlight SpecialKey ctermfg=red

set updatetime=100

" Reload gitgutter on save
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
let g:gitgutter_terminal_reports_focus=0

" All folds open by default
set foldlevelstart=99
