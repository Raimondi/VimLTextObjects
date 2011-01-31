" Sample 2
let i = 1

if i
  let i = 2
elseif
  echom 2
else
  try
    call system('echo 1')
  catch
    echoe 'Trouble'
  finally
    echom 3
  endtry
endif
