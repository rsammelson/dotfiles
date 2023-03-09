" vim setup file
set nocompatible
filetype on

" If vundle is not installed, do it first
let new_vundle = 0
if (!isdirectory(expand("$HOME/.vim/bundle/vundle")))
    call system(expand("mkdir -p $HOME/.vim/bundle"))
    call system(expand("git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/vundle"))
    " echoerr 'Vundle was freshly installed. You should run :BundleInstall'
    let new_vundle = 1
endif

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

" git wrapper for vim
Bundle 'tpope/vim-fugitive'
" sv syntax
Bundle 'systemverilog.vim'

Bundle 'zhou13/vim-easyescape'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

call vundle#end()

if new_vundle == 1
    :PluginInstall
endif

" ==========

" easyescape
cnoremap jk <ESC>
cnoremap kj <ESC>

nnoremap ; :

" ==========

filetype plugin indent on
syntax on

au BufRead,BufNewFile  *.sv set filetype=systemverilog
au BufRead,BufNewFile  *.vh set filetype=systemverilog

set bg=dark
set tabstop=4
set shiftwidth=4
set expandtab
set nu rnu
set sm
set textwidth=100
set wrap
set showcmd
set laststatus=2
set ruler
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=%*
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set nohlsearch

" Show trailing whitespace
" set list
" set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" Remove trailing whitespaces when saving
autocmd BufWritePre * :%s/\s\+$//e
