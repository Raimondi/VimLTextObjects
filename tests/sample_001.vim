" Sample 1
function Test()

  if 1
    echo 1
  elseif 2
    echo 2
  else
    echo s:augroup
  endif
  if !a:0 && result != [[0,0],[0,0]]
    let block_start = substitute(getline(result[0][0]), '^\v\C\s*('.s:beg_words.')?.{-}$', '\1', '')
    if block_start =~ '^'.s:function.start_p .'$'
      let block_name = s:function
    elseif block_start =~ '^'.s:if.start_p .'$'
      let block_name = s:if
    elseif block_start =~ '^'.s:whilefor.start_p .'$'
      let block_name = s:whilefor
    elseif block_start =~ '^'.s:try.start_p .'$'
      let block_name = s:try
    elseif block_start =~ '^'.s:augroup.start_p .'$'
      let block_name = s:augroup
    elseif block_start == ''
      throw "There was no match!"
    else
      throw 'Oops! |'.block_start
    endif
    echom getline(result[0][0]).':'.block_start
    return s:FindTextObject(a:first, a:last, a:middle, block_name)
  else
    return result
  endif

endfunction
