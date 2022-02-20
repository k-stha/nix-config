" Filetype specific configurations are in their own separate folders
" inside after/ftplugin/ folder because they don't always work (or
" work properly) when placed inside the main configuration file

let mapleader = " "

" Disable Language Providers
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

set noloadplugins
set secure
set guicursor=
set number relativenumber
set expandtab
set noswapfile noshelltemp
set ignorecase smartcase
set hidden
set omnifunc=syntaxcomplete#Complete

highlight Number ctermfg=white guifg=white
highlight String ctermfg=white guifg=white
highlight SpellLocal ctermfg=black guifg=black
highlight Visual ctermfg=black ctermbg=white guifg=black guibg=white
highlight Pmenu ctermfg=white ctermbg=DarkMagenta guifg=black guibg=Magenta
highlight PmenuSel ctermfg=white ctermbg=black guifg=white guibg=black

" Highlight Unwanted Whitespaces
" Taken from: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <silent> <Leader>sc :set spell! spelllang=en_us<CR>
nnoremap <silent> <Leader>n :set invnumber invrelativenumber<CR>

" Remove unwanted whitespaces
nnoremap <silent> <Leader>ds :%s/\s\+$//e<CR>:nohlsearch<CR>``

nnoremap <silent> <Leader>r :nohlsearch<CR>
nnoremap <Leader>b :buffers<CR>:
nnoremap <Leader>m :marks<CR>

tnoremap <Esc> <C-\><C-n>

" Indent the entire document (NOTE: not always accurate)
nnoremap <Leader>fi 1G=G``

" Format the document according to the value of textwidth
nnoremap <Leader>fw 1GgqG``

nnoremap <F2> :lnext<CR>
nnoremap <F3> :lprev<CR>
nnoremap <S-F2> :cnext<CR>
nnoremap <S-F3> :cprev<CR>

if has('win32')
  source $VIMRUNTIME\plugin\matchparen.vim
else
  source $VIMRUNTIME/plugin/matchparen.vim
endif
