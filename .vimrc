set encoding=utf-8
scriptencoding utf-8

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/mikami/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/mikami/.cache/dein')
  call dein#begin('/Users/mikami/.cache/dein')
  " Let dein manage dein
  " Required:
  call dein#add('/Users/mikami/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " NERD tree
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " 見た目
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " viewable indent
  call dein#add('Yggdroot/indentLine')

  " ファイル末尾の余分なスペースをハイライト
  call dein#add('bronson/vim-trailing-whitespace')

  " j k 移動の高速化
  call dein#add('rhysd/accelerated-jk')

  " vim で git 操作
  call dein#add('tpope/vim-fugitive')
  " view git diff
  call dein#add('airblade/vim-gitgutter')

  " /検索強化
  call dein#add('osyo-manga/vim-anzu')

  " 補完系
  " call dein#add('Shougo/neocomplete.vim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  " %s等で一括置換する際のハイライト
  call dein#add('osyo-manga/vim-over')

  " syntax
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')

  " ruby
  call dein#add('tpope/vim-endwise')
  call dein#add('osyo-manga/vim-monster')
  call dein#add('todesking/ruby_hl_lvar.vim')
  call dein#add('tpope/vim-rails')

  " elixir
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('mattreduce/vim-mix')

  " golang
  " call dein#add('fatih/vim-go')
  " call dein#add('nsf/gocode')

  " comment out
  call dein#add('tyru/caw.vim')

  call dein#add('ctrlpvim/ctrlp.vim')

  " colorscheme
  call dein#add('tomasr/molokai')

  " blockdiag highlight
  call dein#add('aohta/blockdiag.vim')

  " キャメルケース、スネークケース
  call dein#add('tpope/vim-abolish')

  " JSON
  call dein#add('elzr/vim-json')

  " markdown'
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')

  " open Typora :Typora
  call dein#add('wookayin/vim-typora')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colorscheme molokai
syntax on

"""""""""""""""""""""""""""""
" vim-airline set up
let g:airline_powerline_fonts = 1 " Powerline系フォントを利用する
let g:airline#extensions#branch#enabled = 1 " ブランチ情報を表示する
let g:airline_theme='murmur' " theme for vim-airline-themes
"""""""""""""""""""""""""""""
" accelerated-jk set up
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"""""""""""""""""""""""""""""
" neocomplete.vim set up
" let g:neocomplete#enable_at_startup = 1 " 自動補完機能を有効にする
"""""""""""""""""""""""""""""
" vim-anzu set up
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" set statusline=%{anzu#search_status()}
"""""""""""""""""""""""""""""
" caw.vim set up
" Ctrl + Cの連続でコメントをトグル
nmap <C-c><C-c> <Plug>(caw:hatpos:toggle)
vmap <C-c><C-c> <Plug>(caw:hatpos:toggle)
"""""""""""""""""""""""""""""
" indentLine set up
let g:indentLine_char = '¦'
"""""""""""""""""""""""""""""
" osyo-manga/vim-monster set up
" vim-monsterを有効にする
let g:neocomplete#sources#omni#input_patterns = {
\  'ruby': '[^. *\t]\.\w*\|\h\w*::'
\}


"""""""""""""""""""""""""""""
" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"""""""""""""""""""""""""""""
" kannokanno/previm
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:previm_enable_realtime = 1
"End dein Scripts-------------------------


" Mac で「delete」を有効にする
set backspace=indent,eol,start
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 行番号を表示
set number
" カーソルの行番号を表示
set ruler
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
" set visualbell
" ビープ音を無効
set belloff=all
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
" set wildmode=list:longest
set wildmode=list:full
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
"履歴を1000件保存
set history=1000

set switchbuf+=newtab

" 全角スペースのハイライト
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" let mapleader = ","

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
nnoremap <C-p> :PrevimOpen<CR>
