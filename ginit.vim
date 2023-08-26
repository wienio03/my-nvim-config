let s:fontsize = 12

function! AdjustSize(amount)
    let s:fontsize = s:fontsize+a:amount
    :execute "GuiFont SauceCodePro Nerd Font:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustSize(-1)<CR>a


