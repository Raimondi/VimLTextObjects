" These paths work only if the tests scripts's repos are in the same folder as
" this repo.
let &runtimepath = expand('<sfile>:p:h:h:h').'/runVimTests,'.&rtp
let &runtimepath = expand('<sfile>:p:h:h:h').'/vimtap,'.&rtp
let &runtimepath = expand('<sfile>:p:h:h').','.&rtp
let maps =
      \ {'va': 'ar',
      \  'vi': 'ir',
      \  'oa': 'ar',
      \  'oi': 'ir',
      \  'pva': '<Plug>VimLTextObjectsAll',
      \  'pvi': '<Plug>VimLTextObjectsInner',
      \  'poa': '<Plug>VimLTextObjectsAll',
      \  'poi': '<Plug>VimLTextObjectsInner'}
