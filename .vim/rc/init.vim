"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/dotfiles/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " ~/.vim/rc/dein.toml,deinlazy.tomlを用意する
  let s:toml_dir  = expand('~/dotfiles/.vim/rc')
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

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
  call dein#add('fatih/vim-go')

  " golang
  " call dein#add('fatih/vim-go')
  " call dein#add('nsf/gocode')

  " quickrun
  call dein#add('thinca/vim-quickrun')

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

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
 call dein#install()
endif

filetype plugin indent on
syntax enable

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

let s:rc_dir = expand('~/dotfiles/.vim/rc')

" load *.vim
function! s:source_rc(path)
  let abspath = resolve(expand(s:rc_dir . '/' . a:path))
  if filereadable(abspath)
    execute 'source' abspath
    return
  endif
endfunction
" call s:source_rc('encoding.vim')
call s:source_rc('options.vim')
call s:source_rc('mapping.vim')

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
