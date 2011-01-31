" Test on Sample 6, go to 'for' and :norm 0vird, repeat on 'endfor' and the
" middle of the block.
call vimtest#StartTap()
call vimtap#Plan(5)
edit sample_006.vim
runtime ftplugin/vim/vimtextobjects.vim
3
normal 0vird
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from "for" was correct.')
undo
4
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from "endfor" was correct.')
undo
11
normal 0vird
call vimtap#Is(getline(1,line('$')), ['" Sample 6', '', 'for i in range(0,100)', 'endfor'], 'Check if the selection from inside was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
