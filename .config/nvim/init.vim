set rnu
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

call plug#end()

colorscheme wal
set background=dark
set mouse=a

" STYLING
highlight Comment cterm=italic
highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE cterm=NONE
highlight SpellLocal cterm=Underline ctermbg=NONE

" statusline with lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ }
set foldmethod=marker
imap <C-s> #!/usr/bin/env python3<esc>o<return>
imap <C-l> ""<left>
" Word count
" command wc "set statusline+=%{wordcount().words}\ words"
" Spellcheck in markdown files
autocmd BufNewFile,BufRead *.mkd,*.md,*.mdown,*.markdown set spell
