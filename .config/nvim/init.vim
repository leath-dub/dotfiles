" General settings{{{
set nu
set relativenumber
set nowrap
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set showcmd
set hlsearch
set wildmenu
set path+=**
set wim=longest:full,full
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set backspace=indent,eol,start
set encoding=UTF-8
set showmode
set scrolloff=0
set mouse=a
" set showmatch " shows matching bracket when closing them
set linebreak
set fillchars+=eob:\
set nocompatible
" extra padding on right of numbers
set signcolumn=yes
" split on right
set splitright "}}}

" Vim Plug{{{
call plug#begin('$HOME/.config/nvim/plugged')

" colour schemes
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'

Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'terryma/vim-smooth-scroll'

call plug#end() "}}}

" Themeing{{{
syntax enable
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
set background=dark
set enc=utf-8 "}}}

" STYLING{{{
highlight Comment cterm=italic
highlight SpellLocal cterm=Underline ctermbg=NONE
hi Search cterm=NONE ctermfg=red ctermbg=black
hi IncSearch cterm=NONE ctermfg=red ctermbg=black
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ }
set foldmethod=marker
imap <C-s> #!/usr/bin/env python3<esc>o<return>
nmap <C-l> :w<return> :!groff -e -G % -ms -Tpdf > %.pdf<return><return>
nmap <C-k> :w<return> :!gcc %;./a.out<return>
set colorcolumn=80
"}}}

" Emmet shorcuts{{{
let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","
"}}}

" Spellcheck in markdown files{{{
autocmd BufNewFile,BufRead *.mkd,*.md,*.mdown,*.markdown set spell
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.css set tabstop=4
autocmd BufNewFile,BufRead *.css set shiftwidth=4
autocmd BufNewFile,BufRead *.ms set spell
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * setlocal signcolumn=no"
"}}}

" listing{{{
" adds "·" for space chars
" eol:¬
set lcs+=space:·
set list
"}}}

" Toggle terminal <M-a>{{{
let mapleader = "\<BS>"
nmap <silent> <leader>a :below split term://zsh<return>i
tmap <silent> <leader>a <C-\><C-n><C-w>q
tmap <Esc> <C-\><C-n>
"}}}

" bindings {{{
map <silent> <leader>s :w<CR>
map <silent> <leader>rc :e $MYVIMRC<CR>
" fzf
map <silent> <leader>/ :Files<CR>
" smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
"}}}
