set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/orange/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/orange/.cache/dein')
  call dein#begin('/Users/orange/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/orange/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

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

"End dein Scripts-------------------------
