if exists("g:loaded_superwrite)
  finish
endif

let g:loaded_superwrite = 1

command W call SuperWrite()
fun! SuperWrite()
  silent write !sudo -A tee % >/dev/null
  edit!
endfun

