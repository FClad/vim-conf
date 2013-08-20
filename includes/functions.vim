""""""""""""""""""""
"    Functions     "
""""""""""""""""""""

command SmartAlt :call SmartAlt()
command SmartMake :call SmartMake()

" Smart alternate
function! SmartAlt ()
	let l:pdffile = expand ("%:t:r") . ".pdf"

	if &ft == "tex"
		if has("unix") && system("uname") == "Darwin\n" && filereadable (l:pdffile)
			call system("open -a Skim " . l:pdffile)
		endif
	else
		execute "A"
	endif
endfunction

" Smart make
function! SmartMake()
	" Check whether Vim is run inside a Tmux session
	let l:tmux = system("echo $TMUX")
	let l:cmd = ""

	" Try to determine the appropriate compiling command
	if filereadable("Makefile") || filereadable("makefile")
		let l:cmd = "make"
	elseif &ft == "c"
		let l:cmd = "make " . expand("%")
	elseif &ft == "tex"
		let l:cmd = "latex " . expand("%") . " && dvipdf " . expand("%:t:r") . ".dvi"
	endif

	" Execute command
	if l:tmux != "\n"
		if exists("g:VimuxRunnerPaneIndex")
			echo "Last command re-sent to background Tmux session."
			call VimuxRunLastCommand()
		elseif l:cmd != ""
			echo "Auto-determined command sent to background Tmux session."
			call VimuxRunCommand(l:cmd)
		else
			call VimuxPromptCommand()
		endif
	elseif l:cmd != ""
		echo "No Tmux session found."
		execute "!" . l:cmd
	endif
endfunction

" Return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction


" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

