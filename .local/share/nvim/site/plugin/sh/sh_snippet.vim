if has('win32') && has('nvim')
  let SNIPPET_DIR="$HOME\AppData\Local\nvim-data\site\snippet\sh\"
elseif has('nvim')
  let SNIPPET_DIR="$HOME/.local/share/nvim/site/snippet/sh/"
elseif has('win32')
  let SNIPPET_DIR="$HOME\vimfiles\snippet\sh\"
else
  let SNIPPET_DIR="$HOME/.vim/snippet/sh/"
endif

nnoremap <Leader>scr :execute "read "  . SNIPPET_DIR . "check_root.snippet"<CR>
nnoremap <Leader>sd  :execute "read "  . SNIPPET_DIR . "die.snippet"<CR>
nnoremap <Leader>sf  :execute "read "  . SNIPPET_DIR . "function.snippet"<CR>
nnoremap <Leader>sh  :execute "read "  . SNIPPET_DIR . "help.snippet"<CR>
nnoremap <Leader>srd :execute "read "  . SNIPPET_DIR . "optional_dependancies.snippet"<CR>
nnoremap <Leader>so  :execute "read "  . SNIPPET_DIR . "options.snippet"<CR>
nnoremap <Leader>sqa :execute "read "  . SNIPPET_DIR . "quit_if_no_args.snippet"<CR>
nnoremap <Leader>srs :execute "read "  . SNIPPET_DIR . "read_secret.snippet"<CR>
nnoremap <Leader>se  :execute "read "  . SNIPPET_DIR . "redirect_error.snippet"<CR>
nnoremap <Leader>srd :execute "read "  . SNIPPET_DIR . "required_dependancies.snippet"<CR>
nnoremap <Leader>srr :execute "read "  . SNIPPET_DIR . "run_as_root.snippet"<CR>
nnoremap <Leader>ss  :execute "0read " . SNIPPET_DIR . "start.snippet"<CR>
