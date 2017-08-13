if exists("g:loaded_nvim_compat") || &cp
  finish
endif

let g:loaded_nvim_compat = 1

if !has('nvim')
  finish
endif

nnoremap <C-6> <C-^>
augroup nvim_compat
  au!
  au FocusGained * checktime
augroup end

