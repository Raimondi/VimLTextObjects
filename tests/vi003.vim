" Test on Sample 4, go to 'while' and :norm vird, repeat on 'endwhile'.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_004.vim
runtime ftplugin/vim/vimtextobjects.vim
3
normal 0vird
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', 'while i > 2', 'endwhile'], 'Check if the selection from "while" was correct.')
undo
13
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', 'while i > 2', 'endwhile'], 'Check if the selection from "endwhile" was correct.')
undo
5
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 4', 'let i = 2', 'while i > 2', 'endwhile'], 'Check if the selection from inside the block was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
