" Test on Sample 3, go to 'function' and :norm vard, repeat on 'endfunction'
" and inside the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_003.vim
runtime ftplugin/vim/vimtextobjects.vim
2
normal 0vard
call vimtap#Ok(mapcheck(maps.pva, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.va, 'v') =~# maps.pva, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 3', ''], 'Check if the selection from "function" was correct.')
undo
9
normal 0vard
call vimtap#Is(getline(1,line('$')), ['" Sample 3', ''], 'Check if the selection from "endfunction" was correct.')
undo
3
normal 0vard
call vimtap#Is(getline(1,line('$')), ['" Sample 3', ''], 'Check if the selection from inside the block was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
