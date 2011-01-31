" Test on Sample 1, go to start of first nested block and :norm dar.
call vimtest#StartTap()
call vimtap#Plan(3)
edit sample_001.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poa, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oa, 'o') =~# maps.poa, 'Check Visual All mapping.')
26
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 1', 'function Test()', '', '  if 1', '    echo 1', '  elseif 2', '    echo 2', '  else', '    echo s:augroup', '  endif', '  if !a:0 && result != [[0,0],[0,0]]', '    let block_start = substitute(getline(result[0][0]), ''^\v\C\s*(''.s:beg_words.'')?.{-}$'', ''\1'', '''')', '    echom getline(result[0][0]).'':''.block_start', '    return s:FindTextObject(a:first, a:last, a:middle, block_name)', '  else', '    return result', '  endif', '', 'endfunction'], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
