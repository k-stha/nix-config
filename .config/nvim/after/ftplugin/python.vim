setlocal softtabstop=4 shiftwidth=4
setlocal colorcolumn=80

source $HOME/.local/share/nvim/site/plugin/python/linter.vim
nnoremap <silent> <Leader><CR> :call UsePythonLinter()<CR>
