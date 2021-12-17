set ignorecase         " 検索時に大文字小文字を区別しない
set noswapfile         " スワップファイルを作成しない
set fileformats=unix,dos,mac      "改行コードをLFにする
set directory=.,c:\tmp,c:\temp    "デフォルトの設定（カレントディレクトリに作成）
"set number             "行番号を表示
set relativenumber     "相対行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop4          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set encoding=UTF-8     "UTF-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp  "文字コード自動判定
set virtualedit=block  "テキストがない場所も矩形選択できるようにする
set background=dark
set splitbelow         "新規ウィンドウを下に開く
set splitright         "新規ウィンドウを右に開く

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein.vim

" Required:
if dein#load_state('~/.cache/dein.vim')
  call dein#begin('~/.cache/dein.vim')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein.vim')

  "---------------------------------------------------------
  " Add or remove your plugins here like this:
  "---------------------------------------------------------
   
  " VSCode extension
  if exists('g:vscode')
      " VSCode extension
      call dein#add('asvetliakov/vim-easymotion')
  else
      " ordinary neovim
      call dein#add('easymotion/vim-easymotion')
  endif

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
  call dein#update()
endif

" End dein Scripts-------------------------

" ============================================================================
"   easymotion
" ============================================================================
" VSCode extension
if exists('g:vscode')
    " VSCode extension
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    " ====='asvetliakov/vim-easymotion' =====
    " map <Leader> <Plug>(easymotion-prefix)
    map s <Plug>(easymotion-prefix)
    nmap s <Plug>(easymotion-s2)
    
    " Move to line
    map L <Plug>(easymotion-bd-jk)
else
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-overwin-f2)

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
endif

" Disable default mappings
let g:EasyMotion_do_mapping = 0 

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
