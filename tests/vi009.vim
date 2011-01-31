" Test on Sample 7, go to last line outside block and :norm vird
call vimtest#StartTap()
call vimtap#Plan(3)
edit sample_007.vim
runtime ftplugin/vim/vimtextobjects.vim
$
normal 0vird
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 7', '', 'try', '  let i = 0', '  echom ''i: ''.i', 'catch', '  echoe 1', 'finally', '  echom i', 'endtry', ''], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
