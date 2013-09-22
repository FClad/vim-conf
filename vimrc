" File: .vimrc
" Author: Francois Clad
" Created: 4/01/2012
" Note: Based on a previous version from Xavier Oswald


""""""""""""""""""""
"     General      "
""""""""""""""""""""

set nocompatible				" Use Vim settings, rather then Vi settings (much better!).

runtime bundle/pathogen/autoload/pathogen.vim	" Enable Pathogen
call pathogen#infect()
call pathogen#helptags()

if has("unix")
	set term=xterm-256color			" Allow 256 colors themes and extended key mappings (e.g. SHIFT)
endif

filetype plugin on				" Load filetype plugins
filetype indent on				" Load filetype indents
filetype on						" Autodetect file type
set backspace=indent,eol,start	" More powerful backspacing
set completeopt=longest,menuone	" Completion list ordered by longest match
set ofu=syntaxcomplete#Complete	" Turn on omni completion
set wildmenu					" Allow tab completion in Vim menus
set hidden						" Allow hidden buffers
set enc=utf8


""""""""""""""""""""
"   Theme/Colors   "
""""""""""""""""""""

syntax enable					" Activate syntax coloration
set background=dark				" Default background
colorscheme solarized			" Coloration theme

set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim	" Enable Powerline

""""""""""""""""""""
"  Files/Backups   " 
""""""""""""""""""""

set clipboard=unnamed
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
	if has("win32")
		" Windows specific stuff goes here
		set guifont=Consolas\ for\ Powerline
	elseif has("gui_macvim")
		" MacVim (i.e. OSX) parameters
		set guifont=Source\ Code\ Pro\ for\ Powerline:h13
	else
		" Linux parameters
		set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
	endif
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

set textwidth=80				" Set line width
set fo=tcrqn					" See Help (complex)
set ai							" Auto-indent
set si							" Smart-indent
set cindent						" C-style indenting
set tabstop=4					" Tab spacing
set softtabstop=4				" 2 spaces when pressing <tab> unify
set shiftwidth=4				" Unify
set noexpandtab					" Real tabs please!
set smarttab					" Use tabs at the start of a line, spaces elsewhere


"""""""""""
" Folding "
"""""""""""

set foldlevel=0
set foldnestmax=1


""""""""""""""""""""""""""""""""""""""""
" Include external configuration files "
""""""""""""""""""""""""""""""""""""""""

source ~/.vim/includes/functions.vim
source ~/.vim/includes/mappings.vim
source ~/.vim/includes/plugins.vim


"""""""""""""""""""""""""""""""
" Load type specific settings "
"""""""""""""""""""""""""""""""

"autocmd FileType tex	source ~/.vim/includes/tex.vim
autocmd FileType tex	set nocindent	" Disable indentation
autocmd FileType tes	let g:tex_indent_brace=0
autocmd FileType tex	set nojoinspaces	" Prevents Vim from adding additional spaces when reformatting a paragraph
autocmd FileType tex	let g:surround_{char2nr('c')} = "\\\1command\1{\r}"	" Enable text surrounding with \cmd{..}

" Syntax
autocmd FileType c		set syntax=c.doxygen
autocmd FileType cpp	set syntax=cpp.doxygen

"Folding
autocmd FileType python	set foldmethod=indent
autocmd FileType tex	set foldmethod=indent
autocmd FileType c		set foldmethod=syntax
autocmd FileType cpp	set foldmethod=syntax


""""""""""""""""""""
"  Miscellaneous   "
""""""""""""""""""""

set grepprg=grep\ -nH\ $*

"au bufNewFile *.lp 0r ~/.vim/templates/cplex.lp

