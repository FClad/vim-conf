"""""""""""""""""""""
"   Key mappings    "
"""""""""""""""""""""

" Fix <S-Fx> mapping when GUI is not running
if !has("gui_running")
	map	<Esc>[1;2P	<S-F1>
	map	<Esc>[1;2Q	<S-F2>
	map	<Esc>[1;2R	<S-F3>
	map	<Esc>[1;2S	<S-F4>
	map	<Esc>[17;2~	<S-F6>
	map	<Esc>[18;2~	<S-F7>
	map	<Esc>[19;2~	<S-F8>
endif


" <TAB> and <Shift-TAB> to change indentation level while keeping selection
vnoremap			>			>gv
vmap				<TAB>		>
vnoremap			<			<gv
vmap				<S-TAB>		<

" Use <Ctrl-TAB> and <Ctrl-Shift-TAB> to switch buffers in MRU order
nnoremap			<C-TAB>		:MBEbb<CR>
imap				<C-TAB>		<C-c><C-TAB>
vmap				<C-TAB>		<C-c><C-TAB>
nnoremap			<C-S-TAB>	:MBEbf<CR>
imap				<C-S-TAB>	<C-c><C-S-TAB>
vmap				<C-S-TAB>	<C-c><C-S-TAB>

" <Ctrl-Z> to undo the last change
nnoremap			<C-z>		u
imap				<C-z>		<C-o><C-z>
vmap				<C-z>		<C-c><C-z>

" <Ctrl-Shift-Z> to toggle Gundo pane
nnoremap			<C-S-z>		:GundoToggle<CR>
imap				<C-S-z>		<C-c><C-S-z>
vmap				<C-S-z>		<C-c><C-S-z>

" <Ctrl-R> to redo the last change even in Insert or Visual modes
inoremap			<C-r>		<C-o><C-r>
vnoremap			<C-r>		<C-c><C-r>

" <Ctrl-S> to save the current file
nnoremap			<C-s>		:w<CR>
imap				<C-s>		<C-o><C-s>
vmap				<C-s>		<C-c><C-s>

" <Ctrl-Q> to wipe the current buffer, preserving the window
nnoremap			<C-q>		:MBEbw<CR>

" <Ctrl-Q> to close the current window
" nnoremap			<C-q>		:q<CR>

" <Shift-Arrows> to move between windows
nnoremap <silent>	<S-Left>	:wincmd h<CR>
imap				<S-Left>	<C-c><S-Left>
vmap				<S-Left>	<C-c><S-Left>

nnoremap <silent>	<S-Right>	:wincmd l<CR>
imap				<S-Right>	<C-c><S-Right>
vmap				<S-Right>	<C-c><S-Right>

nnoremap <silent>	<S-Up>		:wincmd k<CR>
imap				<S-Up>		<C-c><S-Up>
vmap				<S-Up>		<C-c><S-Up>

nnoremap <silent>	<S-Down>	:wincmd j<CR>
imap				<S-Down>	<C-c><S-Down>
vmap				<S-Down>	<C-c><S-Down>


" <Alt-up/down> to move 10 lines upper/lower
noremap <silent>	<M-Up>		10<Up>
imap				<M-Up>		<C-o><M-Up>

noremap <silent>	<M-Down>	10<Down>
imap				<M-Down>	<C-o><M-Down>


" <Alt-left/right> to move between words
noremap <silent>	<M-Left>	b
imap				<M-Left>	<C-o><M-Left>

noremap <silent>	<M-Right>	e
imap				<M-Right>	<C-o><M-Right><right>


" <*> and <#> in Visual mode to search for the current selection
vnoremap <silent>	*			:call VisualSearch('f')<CR>
vnoremap <silent>	#			:call VisualSearch('b')<CR>


" <Leader-g> for a pre-filled Vimgrep
map					<leader>g	:vimgrep // **/*.<left><left><left><left><left><left><left>


" <F1> to open alternate file (e.g. %.h from %.c)
nnoremap			<F1>		:call SmartAlt()<CR>
imap				<F1>		<C-c><F1>
vmap				<F1>		<C-c><F1>

" <Shift-F1> to change focus to MBE window
nnoremap			<S-F1>		:MBEFocus<CR>
imap				<S-F1>		<C-c><S-F1>
vmap				<S-F1>		<C-c><S-F1>

" <F2> to toggle the Quickfix pane
nnoremap <silent>	<F2>		:QToggle<CR>
imap				<F2>		<C-c><F2>
vmap				<F2>		<C-c><F2>

" <Shift-F2> to open VimFiler explorer
nnoremap			<S-F2>		:VimFilerExplorer -winwidth=25 -split<CR>
imap				<S-F2>		<C-c><S-F2>
vmap				<S-F2>		<C-c><S-F2>

" <F3> to toggle the Location pane
nnoremap <silent>	<F3>		:LToggle<CR>
imap				<F3>		<C-c><F3>
vmap				<F3>		<C-c><F3>

" <F4> to run a syntax check
nnoremap <silent>	<F4>		:YcmDiags<CR>
imap				<F4>		<C-o><F4>
vmap				<F4>		<C-c><F4>

" <Shift-F4> to toggle Tagbar pane
" nnoremap <silent>	<S-F4>		:TagbarToggle<CR>
" imap				<S-F4>		<C-c><S-F4>
" vmap				<S-F4>		<C-c><S-F4>

" <F5> to build (make) the program
nnoremap			<F5>		:call SmartMake()<CR>
imap				<F5>		<C-o><F5>
vmap				<F5>		<C-c><F5>

" <Shift-F5> to change build command
nnoremap			<S-F5>		:VimuxPromptCommand<CR>
imap				<S-F5>		<C-o><S-F5>
vmap				<S-F5>		<C-c><S-F5>

" <F7> to search and highlight the word under cursor or the selected text
nnoremap <silent>	<F7>		:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
imap				<F7>		<C-o><F7>
vnoremap <silent>	<F7>		:call VisualSearch('f')<CR>:set hls<CR>

" <Shift-F7> to 'Vimgrep' the word under cursor or the selected text
nnoremap			<S-F7>		:vimgrep /<C-R>=expand("<cword>")<CR>/gj **/*<CR>:copen<CR>
" nnoremap			<S-F7>		:call CmdLine('vimgrep /'.expand('<cword>').'/gj ')<CR>
imap				<S-F7>		<Esc><S-F7>
vnoremap			<S-F7>		:call VisualSearch('gv')<CR>

" <F8> to toggle search matches highlighting
nnoremap			<F8>		:set hlsearch! hlsearch?<CR>
imap				<F8>		<C-o><F8>
vmap				<F8>		<C-c><F8>

" <Shift-F8> to toggle spell checker
nnoremap			<S-F8>		:set spell! spell?<CR>
imap				<S-F8>		<C-o><S-F8>
vmap				<S-F8>		<C-c><S-F8>

