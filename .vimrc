"==================================================================================
"
"  main settings
"
"==================================================================================
syntax on
filetype off
filetype plugin indent off
set encoding=utf-8
set fileencodings=utf-8,euc-js,sjis,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set ambiwidth=double
set number
set backspace=indent,eol,start
set noswapfile
set clipboard+=unnamed
set nohlsearch
set cursorline
set noshowmode
set incsearch
set ignorecase
set smartcase
set hlsearch
set hidden
set splitbelow
set wildmenu
set wildmode=full
colorscheme slate


"==================================================================================
"
"  common mappings
"
"==================================================================================
nnoremap j gj
nnoremap k gk


"==================================================================================
"
"  ファイルの再読み込みの設定
"
"==================================================================================
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END


"==================================================================================
"
"  ctags settings
"
"==================================================================================
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>


"==================================================================================
"
"  common commands
"
"==================================================================================
:command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
nnoremap <Space>d :Kwbd<CR>


"==================================================================================
"
"  タブ、空白、改行の可視化
"
"==================================================================================
set list
" set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%


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


"==================================================================================
"
"  netrw.vim settings
"
"==================================================================================
let g:netrw_liststyle = 3
let g:netrw_altv      = 1
let g:netrw_alto      = 1
let g:netrw_list_hide = '.DS_Store,\(^\|\s\s\)\zs\.\S\+'


"==================================================================================
"
"  VimDiff settings
"
"==================================================================================
set diffopt=filler,iwhite,vertical
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21


"==================================================================================
"
"  optional settings
"
"==================================================================================
syntax on
filetype plugin indent on
set expandtab


