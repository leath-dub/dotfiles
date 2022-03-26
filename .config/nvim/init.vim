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
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set backspace=indent,eol,start
set encoding=UTF-8
set showmode
" set showmatch " shows matching bracket when closing them
set linebreak
set fillchars+=eob:\
set nocompatible

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'elkowar/yuck.vim'
Plug 'junegunn/goyo.vim'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'

call plug#end()

"colorscheme wal
syntax enable
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
set background=dark
set mouse=a

" STYLING
highlight Comment cterm=italic
highlight SpellLocal cterm=Underline ctermbg=NONE
"highlight CursorLineNR ctermbg=darkgrey ctermfg=yellow
"highlight LineNr ctermbg=NONE
" statusline with lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ }
set foldmethod=marker
imap <C-s> #!/usr/bin/env python3<esc>o<return>
nmap <C-l> :w<return> :!groff -e -G % -ms -Tpdf > %.pdf<return><return>
nmap <C-k> :w<return> :!gcc %;./a.out<return>

" Emmet shorcuts
let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","

" Word count
" command wc "set statusline+=%{wordcount().words}\ words"
" Spellcheck in markdown files
autocmd BufNewFile,BufRead *.mkd,*.md,*.mdown,*.markdown set spell
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.css set tabstop=4
autocmd BufNewFile,BufRead *.css set shiftwidth=4
autocmd BufNewFile,BufRead *.ms set spell
" adds "·" for space chars
" eol:¬
set lcs+=space:·
set list
