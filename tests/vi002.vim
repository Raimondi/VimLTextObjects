" Test on Sample 3, go to 'function' and :norm vird, repeat on 'endfunction'
" and inside the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_003.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
2
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from "function" was correct.')
undo
9
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from "endfunction" was correct.')
undo
3
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 3', 'function Test()', 'endfunction'], 'Check if the selection from inside the block was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
