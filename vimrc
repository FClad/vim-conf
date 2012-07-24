" File: .vimrc
" Author: Francois Clad
" Created: 4/01/2012
" Note: Based on a previous version from Xavier Oswald


""""""""""""""""""""
"     General      "
""""""""""""""""""""

call pathogen#infect()			" Enable Pathogen
call pathogen#helptags()
set term=xterm-256color			" Allow 256 colors themes and extended key mappings (e.g. SHIFT)
set nocompatible				" Use Vim settings, rather then Vi settings (much better!).

filetype plugin on				" Load filetype plugins
filetype indent on				" Load filetype indents
filetype on						" Autodetect file type
set backspace=indent,eol,start	" More powerful backspacing
set completeopt=longest,menuone	" Completion list ordered by longest match
set ofu=syntaxcomplete#Complete	" Turn on omni completion
set wildmenu					" Allow tab completion in Vim menus
set hidden						" Allow hidden buffers


""""""""""""""""""""
"   Theme/Colors   "
""""""""""""""""""""

syntax enable					" Activate syntax coloration
set background=dark				" Default background
colorscheme solarized			" Coloration theme


""""""""""""""""""""
"  Files/Backups   " 
""""""""""""""""""""

set nobackup					" Turn backup off (use SVN, GIT or TimeMachine instead)
set nowb
try
	set directory=~/.vim/temp	" Set a directory for temp (swap) files
	set undodir=~/.vim/undo		" Unable persistent undo
	set undofile
catch
endtry


""""""""""""""""""""
"      Vim UI      "
""""""""""""""""""""

set ruler						" Show the cursor position all the time
set cmdheight=2					" The command bar is 2 high
set backspace=2					" Make backspace work normal
set report=0					" Tell us when anything is changed via :...
set ignorecase					" Ignore case for searching
set mouse=a						" Enable mouse integration

if has("gui_running")
    set guioptions=egmrt
	set guifont=Menlo:h12
endif


""""""""""""""""""""
"   Visual Cues    " 
""""""""""""""""""""

set number						" Display line numbers
set showmatch					" Show matching brackets
set mat=5						" How many tenths of a second to blink matching brackets for
set nohlsearch					" Do not highlight searched for phrases
set incsearch					" BUT do highlight as you type you search phrase
set so=10						" Keep 10 lines (top/bottom) for scope
set novisualbell				" Don't blink
set noerrorbells				" No noise
set showcmd						" Display incomplete commands
set modeline					" Display the current mode
set nostartofline				" Keep the cursor in the same colon when changing line


""""""""""""""""""""
"   Status line    " 
""""""""""""""""""""
" Statusline setup
set statusline=%#DiffAdd#
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%#DiffAdd#
set statusline+=%f\
set statusline+=%#LineNr#						" Switch to colors used for line number
set statusline+=%{fugitive#statusline()}
set statusline+=%#DiffAdd#						" Switch back to normal
set statusline+=%=								" Left/right separator
set statusline+=%m								" Modified flag
set statusline+=%#DiffChange#
set statusline+=%{&paste?'[paste]':''}			" Display a warning if &paste is set
set statusline+=%#LineNr#						" Switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \  " Current highlight
set statusline+=%#DiffAdd#						" Switch to colors used for line number
set statusline+=%c:								" Cursor column
set statusline+=%l/%L							" Cursor line/total lines
set statusline+=\ %P							" Percent through file

set laststatus=2				" Always show the status line


""""""""""""""""""""
" Text Formatting  " 
""""""""""""""""""""

set textwidth=75				" Set line width
set fo=tcrqn					" See Help (complex)
set ai							" Auto-indent
set si							" Smart-indent
set cindent						" C-style indenting
set tabstop=4					" Tab spacing
set softtabstop=4				" 2 spaces when pressing <tab> unify
set shiftwidth=4				" Unify
set noexpandtab					" Real tabs please!
set smarttab					" Use tabs at the start of a line, spaces elsewhere


""""""""""""""""""""""""""""""""""""""""
" Include external configuration files "
""""""""""""""""""""""""""""""""""""""""

source ~/.vim/functions.vim
source ~/.vim/mappings.vim
source ~/.vim/plugins.vim


"""""""""""""""""""""""""""""""
" Load type specific settings "
"""""""""""""""""""""""""""""""

autocmd FileType tex	source ~/.vim/tex.vim

autocmd FileType c		set syntax=c.doxygen
autocmd FileType cpp	set syntax=cpp.doxygen

""""""""""""""""""""
"  Miscellaneous   "
""""""""""""""""""""

set grepprg=grep\ -nH\ $*

"au bufNewFile *.lp 0r ~/.vim/templates/cplex.lp

