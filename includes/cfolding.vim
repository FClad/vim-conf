
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let n = v:foldend - v:foldstart + 1
  let sub = sub." "
  let info = " " . n . " lines "
  let exp1_len = (strwidth(sub) < w/2) ? (w / 2 - strwidth(info)) : (w - strwidth(sub.info))
  let exp1 = repeat("-", exp1_len)
  let exp2 = repeat(" ", w - strwidth(exp1.sub.info))
  return sub . exp2 . exp1 . info
endfunction

