" Basic settings 
" ===============================================
set encoding=utf-8                              " file encoding

set ruler                                       " show current column in the statusbar 

set number relativenumber                       " precede lines with line numbers (absolute on current and relative on others)

set tabstop=4                                   " size of a hard tabstop (ts)
set shiftwidth=4                                " size of an indentation (sw)
set expandtab                                   " spaces instead of tab characters
set autoindent                                  " leave on the same identation level
set smarttab                                    " insert blanks according to 'shiftwidth' 

set hlsearch                                    " enable search highlighting
hi Search ctermbg=LightYellow                   " background color 
hi Search ctermfg=Red                           " foreground color
nnoremap <esc><esc> :noh<return>                " key-binding to cancel search highlighting
" ===============================================

" Vundle [https://github.com/VundleVim/Vundle.vim]
" ===============================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugins
" -----------------------------------------------
Plugin 'davidhalter/jedi-vim'                   " python autocomplete [https://github.com/davidhalter/jedi-vim]
" -----------------------------------------------
call vundle#end()
filetype plugin indent on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"

" ===============================================
