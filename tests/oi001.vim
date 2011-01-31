" Test on Sample 2, go to 'if' and :norm dir, repeat on 'endif' and inside the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_002.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poi, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oi, 'o') =~# maps.poi, 'Check Visual All mapping.')
4
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', 'if i', 'elseif', '  echom 2', 'else', '  try', '    call system(''echo 1'')', '  catch', '    echoe ''Trouble''', '  finally', '    echom 3', '  endtry', 'endif'], 'Check if the selection from "if" was correct.')
undo
16
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', 'if i', '  let i = 2', 'elseif', '  echom 2', 'else', 'endif'], 'Check if the selection from "endif" was correct.')
undo
7
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', 'if i', '  let i = 2', 'elseif', 'else', '  try', '    call system(''echo 1'')', '  catch', '    echoe ''Trouble''', '  finally', '    echom 3', '  endtry', 'endif'], 'Check if the selection from "endif" was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
