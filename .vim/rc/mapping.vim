" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

map <C-n> :NERDTreeToggle<CR>

inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>

inoremap <C-k> <esc>
vnoremap <C-k> <esc>

vnoremap <C-p> I<C-r>"<esc>

" 入力モード時 jk でESC
inoremap jk <esc>

" kannokanno/previm
" nnoremap <C-p> :PrevimOpen<CR>
