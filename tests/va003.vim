" Test on Sample 4, go to 'while' and :norm vard, repeat on 'endwhile'.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_004.vim
runtime ftplugin/vim/vimtextobjects.vim
3
normal 0vard
call vimtap#Ok(mapcheck(maps.pva, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.va, 'v') =~# maps.pva, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', ''], 'Check if the selection from "while" was correct.')
undo
13
normal 0vard
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', ''], 'Check if the selection from "endwhile" was correct.')
undo
5
normal 0vard
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', ''], 'Check if the selection from inside the block was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
