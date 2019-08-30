set antialias
" colorscheme desert
" set guifont=Monaco:h14

" 参考URL　https://qiita.com/yamatsum/items/171dd5aaf0bb8f11ec60
syntax enable
set background=dark
colorscheme material-theme

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
" set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

set cursorline

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

set clipboard=unnamed,autoselect
set fileencoding=utf-8
set encoding=utf-8
set softtabstop=2
set shiftwidth=2
set textwidth=0
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set nowritebackup
set noswapfile
set virtualedit=block     " 矩形ビジュアルモードで仮想編集を有効にする。
syntax on


"------------------------------------------------------------------------------
" キーマップ

" タブ操作
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

" Ctrl + エンターで改行
noremap <C-CR> o<ESC>

" vv で後ろすべてを選択
vnoremap v $h

" 先頭に貼り付け
nmap <C-p> ^Pj^

" 空白行を削除
" noremap <C-s> :s/\s\+$//g<CR>:nohl<CR>
nmap <C-s> :%s/\s\+$//g<CR>

nmap tt :tabnew<CR>
nmap to :tabnew<CR>:copen<CR>
nmap <silent> cc :cclose<CR>
nmap <silent> co :copen<CR>
nmap <silent> <S-CR> <C-W>T<CR>cc

inoremap jj <Esc><Esc>
nnoremap <silent> \\ :cd ..<CR>:pwd<CR>
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カレントディレクトリを編集中のフォルダにする
nnoremap <silent> <expr> <C-c> ':lcd ' . expand('%:p:h') . expand('<CR>')

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-h> <C-w>>
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w><

"------------------------------------------------------------------------------
" 言語ごとの設定
autocmd FileType python set softtabstop=2
autocmd FileType python set shiftwidth=2
autocmd FileType python set fileformat=unix
autocmd FileType python set fileencoding=utf8
autocmd FileType python nnoremap <silent> // <Home>^i# <Esc>:nohl<CR>
autocmd FileType python vnoremap <silent> // <C-v>^I# <Esc>:nohl<CR>
autocmd FileType python nnoremap <silent> ,, :s/# //<CR>:nohl<CR>
autocmd FileType python vnoremap <silent> ,, :s/# //<CR>:nohl<CR>
autocmd FileType python nmap <expr> gv ':vim /' . expand('<cword>') . '/j **/*.py'

