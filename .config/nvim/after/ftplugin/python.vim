setlocal softtabstop=4 shiftwidth=4
setlocal colorcolumn=80

if has('win32') && has('nvim')
  source $HOME\AppData\Local\nvim-data\site\plugin\python\linter.vim
elseif has('nvim')
  source $HOME/.local/share/nvim/site/plugin/python/linter.vim
elseif has('win32')
  source $HOME\vimfiles\plugin\python\linter.vim
else
  source $HOME/.vim/plugin/python/linter.vim
endif

nnoremap <silent> <Leader><CR> :call UsePythonLinter()<CR>
