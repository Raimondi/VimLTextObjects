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


