"==================================================================================
"
"  全角スペースをハイライト
"
"==================================================================================
function! HighlightMultiByteSpace()
  highlight HighlightMultiByteSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup HighlightMultiByteSpace
    autocmd!
    autocmd ColorScheme       * call HighlightMultiByteSpace()
    autocmd VimEnter,WinEnter * match HighlightMultiByteSpace /　/
  augroup END
  call HighlightMultiByteSpace()
endif

if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

