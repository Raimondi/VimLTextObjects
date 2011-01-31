" Tes on Sample 7, go to 'try' and :norm 0dar, repeat on 'endtry' and inside
" the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_007.vim
runtime ftplugin/vim/vimtextobjects.vim
call vimtap#Ok(mapcheck(maps.poa, 'o') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.oa, 'o') =~# maps.poa, 'Check Visual All mapping.')
3
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', '', ''], 'Check if the selection from "try" was correct.')
undo
10
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', '', ''], 'Check if the selection from "endtry" was correct.')
undo
6
normal 0dar
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', '', ''], 'Check if the selection from "catch" was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
