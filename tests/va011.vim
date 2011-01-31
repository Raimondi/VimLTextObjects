" Test on Sample 1, go inside block and :norm vGard, repeat upwards.
call vimtest#StartTap()
call vimtap#Plan(4)
edit sample_001.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.pva, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.va, 'v') =~# maps.pva, 'Check Visual All mapping.')
26
normal 0vGard
call vimtap#Is(getline(1,line('$')), ['" Sample 1', ''], 'Check if the selection was correct.')
undo
26
normal 0vggard
call vimtap#Is(getline(1,line('$')), ['" Sample 1', 'function Test()', '', '  if 1', '    echo 1', '  elseif 2', '    echo 2', '  else', '    echo s:augroup', '  endif', '  if !a:0 && result != [[0,0],[0,0]]', '    let block_start = substitute(getline(result[0][0]), ''^\v\C\s*(''.s:beg_words.'')?.{-}$'', ''\1'', '''')', '    ', '    echom getline(result[0][0]).'':''.block_start', '    return s:FindTextObject(a:first, a:last, a:middle, block_name)', '  else', '    return result', '  endif', '', 'endfunction'], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
