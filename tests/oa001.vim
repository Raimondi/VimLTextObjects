" Test on Sample 2, go to 'if' and :norm dar, repeat on 'endif' and inside the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_002.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poa, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oa, 'o') =~# maps.poa, 'Check Visual All mapping.')
4
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', ''], 'Check if the selection from "if" was correct.')
undo
16
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', ''], 'Check if the selection from "endif" was correct.')
undo
7
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', ''], 'Check if the selection from "endif" was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
