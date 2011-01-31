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

" Sample 2
let i = 1

if i
  let i = 2
elseif
  echom 2
else
  try
    call system('echo 1')
  catch
    echoe 'Trouble'
  finally
    echom 3
  endtry
endif

" Sample 3
function Test()
  echo 1
  if 1 == 0
    return 2
  else
    return 3
  endif
endfunction

" Sample 4
let i = 2
while i > 2
  let i -= 1
  echo 'LOL'
  if i == 2
    continue
  elseif i != 0
    break
  else
    echom 'ROFL'
  endif
endwhile

" Sample 5

augroup oops
  au!
  au FileType vim echom 'Namaste'

augroup END

" Sample 6

for i in range(0,100)
  echom i
  while i < 0
    echom i + 1
    let i -= 1
    continue
  endwhile
  break
endfor

" Sample 7

try
  let i = 0
  echom 'i: '.i
catch
  echoe 1
finally
  echom i
endtry

" Sample 8

function s:apropo()
if this_line == too_big &&
      \ is_also_continued == true
  " One comment if
  " end
  while this &&
        \ that ||
        \ those &&
        \ these
    echom 4
    let too_big = false
    try
      " Another comment
      let o = 1
      for i in range(1,10)
        echom 'They'
        augroup nesting_nest
          au!
          au InserCharPre * echo v:char
        augroup END
        s/././
      endfor
      undo
      redo
  endwhile
  echom 9
  let true = 1
  let false = 0
endif
endfunction


