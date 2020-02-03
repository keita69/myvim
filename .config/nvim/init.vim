set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set splitbelow         "新規ウィンドウを下に開く
set splitright         "新規ウィンドウを右に開く

set background=dark
colorscheme desert

set fileformats=unix,dos,mac
set encoding=utf-8


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('C:\Users\keita\.cache\dein')
  call dein#begin('C:\Users\keita\.cache\dein')

  " Let dein manage dein
  " Required:
  call dein#add('C:\Users\keita\.cache\dein\repos\github.com\Shougo\dein.vim')

  "---------------------------------------------------------
  " Add or remove your plugins here like this:
  "---------------------------------------------------------
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jacoborus/tender.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app & yarn install' })
  call dein#add('mattn/webapi-vim')
  call dein#add('simeji/winresizer')
  call dein#add('keita69/post-mattermost.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('fuenor/qfixhowm')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  let g:python3_host_prog = 'C:\Python38\python.exe'

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

" ============================================================================
"   キーバインド
" ============================================================================
" buffer移動
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" <Esc> で :terminal の insert を抜ける
tnoremap <Esc> <C-\><C-n>

" コメントアウト自動整形機能OFF
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END

" ============================================================================
"   User Commnad
" ============================================================================
" terminalでgitbashを開く
:command! GitBash terminal bash -l

" ============================================================================
"   Post Mattermost
" ============================================================================
let g:post_mattermost_access_token = "f6155dhdstf9fxt3dknnwijbaa"
let g:post_mattermost_endpoint = "http://192.168.33.1:8065"
let g:post_mattermost_channel_id_default = "cu588ys1piyftgjhnwaogrs96e"
let g:post_mattermost_curl_opt = "--noproxy 192.168.33.1"

" ============================================================================
"    winresizer
" ============================================================================
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" ============================================================================
"   netrw
" ============================================================================
" 1: ls -laのような表示になります 3: tree
let g:netrw_liststyle=3
" ファイラのwindowサイズを20に設定
let g:netrw_winsize=50
" サイズを(K,M,G)で表示
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd hh:mm:ss で表示
let g:netrw_timefmt="%Y/%m/%d %H:%M:%S"

" ヘッダを非表示にする
let g:netrw_banner=0
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

" ============================================================================
"   vim-table-mode
" ============================================================================
let g:table_mode_corner='|'

" ============================================================================
"   QFixHowm
" ============================================================================
" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/.cache/qfixhowm-master

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/AppData/070_knowhow/qfixhowm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更する
let QFixHowm_Title = '#'

"エントリを自動整形する
"0に設定すると、全ての整形処理を無効
"2に設定すると、一ファイル複数エントリのエントリ間の空白行も削除する
let QFixHowm_Autoformat = 0

" ============================================================================
"   markdown preview
"   https://github.com/iamcco/markdown-preview.nvim
" ============================================================================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" Mapping
" normal/insert
"<Plug>MarkdownPreview
"<Plug>MarkdownPreviewStop
"<Plug>MarkdownPreviewToggle

" short-cut example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" ============================================================================
"   vim-airline
"   https://github.com/vim-airline/vim-airline
"   https://github.com/vim-airline/vim-airline-themes
" ============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='base16'

" ============================================================================
" vim-gitgutter
" ============================================================================
let g:gitgutter_sign_added = 'ad'
let g:gitgutter_sign_modified = 'md'
let g:gitgutter_sign_removed = 'rm'
"let g:gitgutter_git_executable = 'C:\Tools\Git\bin\git.exe'
let g:gitgutter_highlight_lines = 1


