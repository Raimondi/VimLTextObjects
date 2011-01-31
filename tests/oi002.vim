" Test on Sample 3, go to 'function' and :norm dir, repeat on 'endfunction'
" and inside the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_003.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poi, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oi, 'o') =~# maps.poi, 'Check Visual All mapping.')
2
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from "function" was correct.')
undo
9
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from "endfunction" was correct.')
undo
3
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from inside the block was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
