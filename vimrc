" File: .vimrc
" Author: Francois Clad
" Created: 4/01/2012


" Improved Vi mode (must be first)
set nocompatible


" =============== General settings ===============

set hidden						" Allow hidden buffers
set number						" Display line numbers
set backspace=indent,eol,start	" Normal backspace behavior in Insert mode
set showcmd						" Display incomplete commands
set modeline					" Display the current mode
set novisualbell				" Don't blink
set noerrorbells				" No noise
set encoding=utf-8				" Set encoding to UTF-8
set ruler						" Show the cursor position all the time
set cmdheight=2					" The command bar is 2 high
set showmatch					" Show matching brackets
set mat=5						" How many tenths of a second to blink matching brackets for
set scrolloff=10				" Keep 10 lines (top/bottom) for scope
set splitbelow					" Horizontal  split put the new window below (more intuitive)
set splitright					" Vertical split put the new window on the right (more intuitive)
set nostartofline				" Keep the cursor in the same colon when changing line
set laststatus=2				" Always show the status line
set report=0					" Always show a report when something changed

set mouse=a						" Enable mouse integration
set clipboard=unnamed			" Enable clipboard sharing with the system

syntax enable					" Activate syntax-based coloring

" Use Doxygen syntax highlighting for C and C++ files
autocmd FileType c		set syntax=c.doxygen
autocmd FileType cpp	set syntax=cpp.doxygen


" ============== Initialize plugins ==============

" Load plugins listed in 'vundles.vim' using the Vundle manager
if filereadable (expand ("~/.vim/includes/vundles.vim"))
	source ~/.vim/includes/vundles.vim
endif


" =============== Temporary files ================

set writebackup					" Keep backups when writing a file
set nobackup					" But delete them afterwards

set directory=~/.vim/temp	" Set a directory for temp (swap) files
set undodir=~/.vim/undo		" Unable persistent undo
set undofile


" =============== Text formatting ================

set autoindent					" Auto-indent
set smartindent					" Smart-indent
set cindent						" C-style indenting
set tabstop=4					" Tabs are 4 spaces long
set softtabstop=4				" Unify
set shiftwidth=4				" Unify
set smarttab					" Tabs at the start of a line, spaces elsewhere
set noexpandtab					" Real tabs please!

set textwidth=80				" Set line width
set colorcolumn=81				" Show line width

set formatoptions=tcrqn			" See Help (complex)

" Special indent and spacing options for Latex files
autocmd FileType tex	set nocindent				" Disable C indentation
autocmd FileType tex	let g:tex_indent_brace=0
autocmd FileType tex	set nojoinspaces			" Disable joining spaces


" ================= Code folding =================

set nofoldenable				" Disable folding by default
set foldnestmax=1				" Prevent nested folding

autocmd FileType tex	set foldmethod=indent
autocmd FileType c		set foldmethod=syntax
autocmd FileType cpp	set foldmethod=syntax

" Additional folding rules for C files
autocmd FileType c		source ~/.vim/includes/cfolding.vim


" ================== Completion ==================

set completeopt=longest,menuone	" Completion list options

set wildmenu					" Allow tab completion in Vim menus

set wildignore=*.o,*.obj,*.d	" Completion ignore list
set wildignore+=*vim/temp*
set wildignore+=*vim/undo*
set wildignore+=*DS_Store*
set wildignore+=log/**,tmp/**,ios/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=tags


" ==================== Search ====================

set nohlsearch					" Do not highlight searched for phrases
set incsearch					" BUT do highlight as you type you search phrase
set ignorecase					" Ignore case for searching
set smartcase					" Except if a capital letter is used


" ================== Appearance ==================

if has("gui_running")
    set guioptions=egmt		" GUI settings

	" Set GUI font depending on the platform
	if has("win32")
		set guifont=Consolas\ for\ Powerline
	elseif has("gui_macvim")
		set guifont=Source\ Code\ Pro\ for\ Powerline:h15
	else
		set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
	endif
elseif has("unix")
	set term=xterm-256color		" Force 256 color under Linux
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

set background=dark
colorscheme one				" Use rakr/vim-one theme

" Fix to highlight function names in C
autocmd FileType c	syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
autocmd FileType c	highlight def link cCustomFunc Function


" ========== Additional configurations ===========

source ~/.vim/includes/plugins.vim
source ~/.vim/includes/functions.vim
source ~/.vim/includes/mappings.vim

