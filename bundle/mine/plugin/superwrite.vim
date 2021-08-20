if exists("g:loaded_superwrite")
  finish
endif

let g:loaded_superwrite = 1

command W call SuperWrite()
fun! SuperWrite()
"  added touch id to sudo config so i no longer need askpass
"  silent write !sudo -A tee % >/dev/null
  silent write !sudo tee % >/dev/null
  edit!
endfun

