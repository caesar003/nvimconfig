" ~/.config/nvim/syntax/ksession.vim

" Comments
syntax match ksessionComment /^#.*/ contains=@Spell
highlight link ksessionComment Comment

" Title (the first token)
syntax match ksessionTitle /^[^# \t]\+/ nextgroup=ksessionPath
highlight link ksessionTitle Identifier

" Path (second token)
syntax match ksessionPath /\s\+\zs\(\~\/\S*\|\S*\/\S*\)/
highlight link ksessionPath Directory

