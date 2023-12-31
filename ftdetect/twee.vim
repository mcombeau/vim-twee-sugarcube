" Set file type "twee" for .tw and .twee files to enable syntax highlighting.
au BufRead,BufNewFile *.tw,*.twee set filetype=twee 

" Enable line wrapping in .tw or .twee files.
augroup WrapLineInTweeFile
    autocmd!
    autocmd FileType twee setlocal wrap
augroup END

" Enable spell checking in .tw or .twee files.
augroup HighlightBadSpellingInTweeFile
  autocmd!
  autocmd FileType twee set spell 
augroup END
