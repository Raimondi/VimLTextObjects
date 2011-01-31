" Test on Sample 1, go inside block and :norm v4ird.
call vimtest#StartTap()
call vimtap#Plan(3)
edit sample_001.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
26
normal 0v4ird
call vimtap#Is(getline(1,line('$')), ['" Sample 1', 'function Test()', '', '  if 1', '    echo 1', '  elseif 2', '    echo 2', '  else', '    echo s:augroup', '  endif', '  if !a:0 && result != [[0,0],[0,0]]', '  endif', '', 'endfunction'], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
