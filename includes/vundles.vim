""""""""""""""""""""
"   Load plugins   "
""""""""""""""""""""


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


" List of plugins
Plugin 'Valloric/YouCompleteMe'	" Auto-completion engine
Plugin 'scrooloose/syntastic'	" Syntax checker
Plugin 'bling/vim-airline'		" Status/tab line (replaces vim-powerline)
Plugin 'sirver/UltiSnips'		" Snippet engine
Plugin 'honza/vim-snippets'		" Snippet database
Plugin 'tomtom/tlib_vim'		" Requirement for tskeleton_vim
Plugin 'tomtom/tskeleton_vim'	" File skeleton manager
Plugin 'sjbach/lusty'			" Fast buffer juggler
Plugin 'Shougo/unite.vim'		" Buffers and files explorer
Plugin 'majutsushi/tagbar'		" Show file tags in a side window
Plugin 'airblade/vim-gitgutter'	" Show Git diffs
Plugin 'plasticboy/vim-markdown' " Add support for Markdown syntax
Plugin 'sjl/gundo.vim'			" Show undo tree
Plugin 'tpope/vim-fugitive'		" Git wrapper
Plugin 'tpope/vim-surround'		" Manage surrounding characters
Plugin 'vim-scripts/a.vim'		" Jump to alternate file (e.g. .h from .c)
Plugin 'milkypostman/vim-togglelist' " Toggle Quickfix and Location lists
Plugin 'benmills/vimux'			" Run commands into from Vim into Tmux
Plugin 'vim-scripts/bufkill.vim' " Close buffers while keeping the windows
Plugin 'flazz/vim-colorschemes'	" Color schemes database


" End of plugin initialization
call vundle#end()

" Enable file type detection with loading of plugins and indent files
filetype plugin indent on
