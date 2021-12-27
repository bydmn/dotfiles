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


"==================================================================================
"
"  common mappings
"
"==================================================================================
nnoremap j gj
nnoremap k gk
let mapleader = "\<SPACE>"


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
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%


"==================================================================================
"
"  plugin settings
"
"==================================================================================
"vim-plug settings
let s:data_home = empty($XDG_DATA_HOME) ? expand($HOME.'/.local/share') : $XDG_DATA_HOME
let s:plug_file = expand(s:data_home) . '/nvim/site/autoload/plug.vim'
if empty(s:plug_file)
  csilent execute 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source '~/.config/nvim/init.vim'
endif

let s:plugged_dir = expand(stdpath('data').'/plugged')

call plug#begin(s:plugged_dir)
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" function! BuildYCM(info)
"   " info is a dictionary with 3 fields
"   " - name:   name of the plugin
"   " - status: 'installed', 'updated', or 'unchanged'
"   " - force:  set on PlugInstall! or PlugUpdate!
"   if a:info.status == 'installed' || a:info.force
"     !./install.py
"   endif
" endfunction

Plug 'tmhedberg/matchit' " カッコ同士のジャンプ機能にhtmlタグなどへの対応
Plug 'AndrewRadev/splitjoin.vim' " コードの{}カッコなどの開閉
Plug 'djoshea/vim-autoread' " バッファの変更の自動更新
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile', 'for': 'json' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile', 'for': ['typescript', 'typescriptreact'] }
Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'neoclide/coc-rls', {'for': 'rust'}
Plug 'neoclide/coc-tabnine', { 'do': 'yarn install --frozen-lockfile' }
Plug 'antoinemadec/FixCursorHold.nvim' " depends on fern
Plug 'lambdalisue/fern.vim' " filer
Plug 'nvim-treesitter/nvim-treesitter' " colorscheme
Plug 'sainnhe/gruvbox-material' " colorscheme
Plug 'junegunn/fzf', {'dir': '~/.fzf_bin', 'do': './install --all'} " fuzzy finder
Plug 'AlessandroYorba/Sierra'

" Initialize plugin system
call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim


"==================================================================================
"
"  optional settings
"
"==================================================================================
syntax on
filetype plugin indent on
set expandtab

