""""""""""""""""""""""""""""
"  Plugins configuration   "
""""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 0	" Tags file based completion
let g:tex_flavor='latex'		" Force type of empty .tex files to 'tex'

" Syntastic
let g:syntastic_enable_signs=1	" Mark syntax errors with :signs
let g:syntastic_auto_jump=0		" Do not automatically jump to the first error
let g:syntastic_auto_loc_list=1 " Show the error list automatically
let g:syntastic_mode_map = { 'mode': 'passive' } " Disable auto-check on saving

" Vim-airline
let g:airline_powerline_fonts = 1	" Enable fancy symbols

" LustyJuggler
let g:LustyJugglerAltTabMode = 1	" Enable buffer cycling by repressing hotkey

" Unite
call unite#custom#profile('default', 'context', {
\   'winheight': 10,
\ })

" Surround
autocmd FileType tex
\ let g:surround_{char2nr('c')} = "\\\1command\1{\r}" " Surround w/ TeX command

" Vimux
let g:VimuxUseNearestPane = 1		" Allow Vimux to run in an existing pane
let g:VimuxUseNearestReverse = 1	" Select the most distant inactive pane

" tSkeleton
let g:tskelDateFormat = '%Y-%m-%d'
let g:tskelUserName = 'Francois Clad'
let g:tskelUserEmail = 'francois.clad@imdea.org'
autocmd BufNewFile *.c TSkeletonSetup template.c
autocmd BufNewFile *.h TSkeletonSetup template.h

