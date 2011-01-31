" Test on Sample 7, go to 'try' and :norm 0vird, repeat on 'endtry' and inside
" the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_007.vim
runtime ftplugin/vim/vimtextobjects.vim
3
normal 0vird
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', 'try', 'catch', '  echoe 1', 'finally', '  echom i', 'endtry', ''], 'Check if the selection from "try" was correct.')
undo
10
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', 'try', '  let i = 0', '  echom ''i: ''.i', 'catch', '  echoe 1', 'finally', 'endtry', ''], 'Check if the selection from "endtry" was correct.')
undo
6
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', 'try', '  let i = 0', '  echom ''i: ''.i', 'catch', 'finally', '  echom i', 'endtry', ''], 'Check if the selection from "catch" was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
