" Test on Sample 2, go to first line outside block and :norm dar
call vimtest#StartTap()
call vimtap#Plan(3)
edit sample_002.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poa, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oa, 'o') =~# maps.poa, 'Check Visual All mapping.')
3
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', 'if i', '  let i = 2', 'elseif', '  echom 2', 'else', '  try', '    call system(''echo 1'')', '  catch', '    echoe ''Trouble''', '  finally', '    echom 3', '  endtry', 'endif'], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
