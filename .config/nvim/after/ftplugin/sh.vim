setlocal softtabstop=4 shiftwidth=4
setlocal colorcolumn=80

setlocal makeprg=shellcheck\ -a\ --format=gcc\ --enable=all
nnoremap <silent> <Leader><CR> :lmake %<CR>
