" chill.vim - Chill Neovim color scheme
" Maintainer: Ethan
" Version: 1.0.0

if exists("g:loaded_chill")
  finish
endif
let g:loaded_chill = 1

" Set up command to load the colorscheme
command! -nargs=0 Chill colorscheme chill
