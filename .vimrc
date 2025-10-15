" Basic
" ===============================================
set nocompatible                                " be iMproved, required
filetype off                                    " required

set encoding=utf-8                              " file encoding

set ruler                                       " show current column in the statusbar 
set number relativenumber                       " precede lines with line numbers (absolute on current and relative on others)

set tabstop=4                                   " size of a hard tabstop (ts)
set shiftwidth=4                                " size of an indentation (sw)
set smarttab                                    " insert blanks according to 'shiftwidth' 
set expandtab                                   " spaces instead of tab characters
set autoindent                                  " leave on the same identation level

set hlsearch                                    " enable search highlighting
hi Search ctermbg=LightYellow                   " background color 
hi Search ctermfg=Red                           " foreground color
nnoremap <esc><esc> :noh<return>                " key-binding to cancel search highlighting
" ===============================================


" Vundle [https://github.com/VundleVim/Vundle.vim]
" ===============================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
" -----------------------------------------------
Plugin 'rafi/awesome-vim-colorschemes.git'      " colorschemes
Plugin 'vim-python/python-syntax'               " python highlighting
" -----------------------------------------------

call vundle#end()
filetype plugin indent on
" ===============================================


" Plugins settings
" ===============================================
set background=dark                             " important var for colorscheme 
:colorscheme jellybeans                         " some colorscheme

let g:python_highlight_all = 1                  " enable all syntax highlighting features
" ===============================================

inoremap jj <Esc>

