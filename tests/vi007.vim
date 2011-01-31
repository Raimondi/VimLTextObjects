" Test on Sample 2, go to the middle and :norm virirird
call vimtest#StartTap()
call vimtap#Plan(3)
edit sample_002.vim
runtime ftplugin/vim/vimtextobjects.vim
12
normal 0virirird
call vimtap#Ok(mapcheck(maps.pvi, 'v') != '', 'Check <Plug> mapping.')
call vimtap#Ok(maparg(maps.vi, 'v') =~# maps.pvi, 'Check Visual All mapping.')
call vimtap#Is(getline(1,line('$')), ['" Sample 2', 'let i = 1', '', 'if i', '  let i = 2', 'elseif', '  echom 2', 'else', 'endif'], 'Check if the selection was correct.')
call vimtest#SaveOut()
call vimtest#Quit()
