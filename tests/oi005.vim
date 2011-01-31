" Test on Sample 7, go to 'try' and :norm 0dir, repeat on 'endtry' and inside
" the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_007.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poi, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oi, 'o') =~# maps.poi, 'Check Visual All mapping.')
3
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from "try" was correct.')
undo
10
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from "endtry" was correct.')
undo
6
normal 0dir
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from "catch" was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
