UsePlugin 'fzf.vim'

let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

nnoremap <silent> <C-f>f :Files<CR>
nnoremap <silent> <C-f>g :Ag<CR>

