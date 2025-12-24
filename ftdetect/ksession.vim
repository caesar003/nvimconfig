augroup ksession
  autocmd!
  autocmd BufRead,BufNewFile *.ksession,*.session,*.txt
        \ if getline(1) =~# '^[A-Za-z0-9_-]\+ \S\+' |
        \   setfiletype ksession |
        \ endif
augroup END

