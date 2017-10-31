""""""""""""""""""""""""""""
"  Plugins configuration   "
""""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Tags file based completion
let g:ycm_key_list_select_completion = ['<Down>'] " Removed <TAB> from the list
let g:ycm_key_list_previous_completion = ['<Up>'] " Removed <S-TAB>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<F9>'
let g:tex_flavor='latex'		" Force type of empty .tex files to 'tex'

" EasyTags
let g:easytags_async = 1 " Run Exuberant Ctags in background
let g:easytags_syntax_keyword = 'always' " Make Vim-Easytags faster

" Syntastic
" let g:syntastic_enable_signs=1	" Mark syntax errors with :signs
" let g:syntastic_auto_jump=0		" Do not automatically jump to the first error
" let g:syntastic_always_populate_loc_list = 1 " Populate loc list after checking
" let g:syntastic_auto_loc_list=1 " Show the error list automatically
" let g:syntastic_mode_map = { 'mode': 'passive' } " Disable auto-check on saving

" VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' ' "'┊'
let g:vimfiler_tree_opened_icon = '▽'
let g:vimfiler_tree_closed_icon = '▶'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" Vim-airline
let g:airline_powerline_fonts = 1	" Enable fancy symbols
let g:airline#extensions#whitespace#mixed_indent_algo = 1 " Spaces after tabs
let g:airline_theme='one'

" CtrlSpace
" let g:ctrlspace_use_tabline = 1
" let g:CtrlSpaceUseMouseAndArrowsInTerm = 1

" Surround
autocmd FileType tex
\ let g:surround_{char2nr('c')} = "\\\1command\1{\r}" " Surround w/ TeX command

" Vimux
let g:VimuxUseNearestPane = 1		" Allow Vimux to run in an existing pane
let g:VimuxUseNearestReverse = 1	" Select the most distant inactive pane

" ListToggle
let g:lt_height = 10			" Set height of Quickfix and Location windows

" tSkeleton
let g:tskelDateFormat = '%Y-%m-%d'
let g:tskelUserName = '<your name>'
let g:tskelUserEmail = '<your email address>'
autocmd BufNewFile *.c TSkeletonSetup template.c
autocmd BufNewFile *.h TSkeletonSetup template.h

" MiniBufExplorer
let g:miniBufExplCycleArround = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplShowBufNumbers = 0

