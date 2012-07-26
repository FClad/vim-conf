""""""""""""""""""""""""""""
"  Plugins configuration   "
""""""""""""""""""""""""""""

let g:tex_flavor='latex'

let g:LustyJugglerAltTabMode = 1

let g:CSApprox_loaded = 1
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=0
"disable automatic syntax checking on saving
let g:syntastic_mode_map = { 'mode': 'passive' }

"disable real time auto-completion at startup
" let g:acp_CompleteoptPreview = 1
let g:acp_enableAtStartup = 0

"change default .vimproject location
let g:indexer_projectsSettingsFilename = '.vimproject'

"show function prototype
let OmniCpp_ShowPrototypeInAbbr = 1

