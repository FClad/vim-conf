""""""""""""""""""""
"   Load plugins   "
""""""""""""""""""""

" Install plugins:
" :source %
" :PluginInstall


" Disable file type detection (mandatory for Vundle)
filetype off

" Include Vundle in runtime path and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Fix plugin install / update crashes with MacVim under Yosemite
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif


" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Essentials
Plugin 'sjl/gundo.vim'				" Show undo tree
Plugin 'tpope/vim-surround'			" Manage surrounding characters
Plugin 'Raimondi/delimitMate'		" Auto-close quotes, parents and brackets
Plugin 'tpope/vim-eunuch'			" Basic Unix shell commands
Plugin 'xolox/vim-misc'				" Dependency for vim-session and vim-easytags
Plugin 'xolox/vim-session'			" Session manager

" Interface
Plugin 'flazz/vim-colorschemes'		" Color schemes database
Plugin 'bling/vim-airline'			" Status/tab line (replaces vim-powerline)
Plugin 'Shougo/unite.vim'			" File explorer (dependency for VimFiler)
Plugin 'Shougo/vimfiler.vim'		" File explorer
Plugin 'fholgado/minibufexpl.vim'	" Buffer explorer
Plugin 'Valloric/ListToggle'		" Toggle Quickfix and Location lists
" Plugin 'majutsushi/tagbar'		" Show file tags in a side window

" Basic coding
Plugin 'plasticboy/vim-markdown'	" Add support for Markdown syntax
Plugin 'vim-scripts/doxygentoolkit.vim' " Doxygen blocks generator
Plugin 'vim-scripts/a.vim'			" Jump to alternate file (e.g. .h from .c)

" Power coding
Plugin 'Valloric/YouCompleteMe'		" Auto-completion engine
Plugin 'rdnetto/YCM-Generator'		" Config file generator for YCM
Plugin 'tmhedberg/SimpylFold'		" Proper folding method for Python
" Plugin 'klen/python-mode.git'		" Python essentials
" Plugin 'scrooloose/syntastic'		" Syntax checker
" Plugin 'sirver/UltiSnips'			" Snippet engine
" Plugin 'honza/vim-snippets'		" Snippet database
" Plugin 'tomtom/tlib_vim'			" Requirement for tskeleton_vim
" Plugin 'tomtom/tskeleton_vim'		" File skeleton manager
Plugin 'xolox/vim-easytags'			" Tag generation and syntax highlighting

" Integration with other programs
Plugin 'tpope/vim-fugitive'			" Git wrapper
Plugin 'benmills/vimux'				" Run commands into from Vim into Tmux
Plugin 'airblade/vim-gitgutter'		" Show Git diffs
Plugin 'rakr/vim-one'


" End of plugin initialization
call vundle#end()

" Enable file type detection with loading of plugins and indent files
filetype plugin indent on

