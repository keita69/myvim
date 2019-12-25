"set shell=C:\WINDOWS\System32\bash.exe "WLS bash
"set shellcmdflag=-c
"set shellquote=\"
"set shellxescape=
"set shellxquote=
set noswapfile         " スワップファイルを作成しない
set fileformats=unix,dos,mac      "改行コードをLFにする
set directory=.,c:\tmp,c:\temp    "デフォルトの設定（カレントディレクトリに作成）
set number             "行番号を表示
"set relativenumber     "相対行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard+=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set encoding=UTF-8     "UTF-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8  "文字コード自動判定
set virtualedit=block  "テキストがない場所も矩形選択できるようにする
if &compatible         "hoge
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein.vim
if dein#load_state('~/.cache/dein.vim')
  call dein#begin('~/.cache/dein.vim')
  call dein#add('~/.cache/dein.vim')
  call dein#add('~/.cache/ale')
  call dein#add('~/.cache/vim-airline')
  call dein#add('~/.cache/vim-airline-themes')
  call dein#add('~/.cache/vim-devicons')
  call dein#add('~/.cache/tender.vim')  " カラースキームのセット
  call dein#add('~/.cache/vim-gitgutter')  " git diff plugin
  call dein#add('~/.cache/vim-table-mode') 
  call dein#add('~/.cache/sonictemplate-vim') 
  call dein#add('~/.cache/winresizer')    "windowサイズを簡単に変更
  call dein#add('~/.cache/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app & yarn install' }) " markdown preview
  call dein#add('~/.cache/post-mattermost.vim') 
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
colorscheme desert   "カラーセット
" 検索のハイライトを除去
nnoremap <Esc><Esc> :nohlsearch<CR>
" UNDO永続化
if has('persistent_undo')
  let undo_path = expand('~/.config/undo')
  exe 'set undodir=' . undo_path
  set undofile
endif
" <Esc> で :terminal の insert を抜ける
tnoremap <Esc> <C-\><C-n>

" ============================================================================
"   post-mattermost
" ============================================================================
let g:post_mattermost_access_token = "wh7660j6difefbegosaywiysoe"
let g:post_mattermost_endpoint = "http://10.130.74.90"
let g:post_mattermost_channel_id = "tk3i767x87f3dgitxatksujr5o"
let g:post_mattermost_curl_opt = "--noproxy 10.130.74.90" 

" ============================================================================
"   netrw 
" ============================================================================
" ls -laのような表示になります
let g:netrw_liststyle=1
" サイズを(K,M,G)で表示
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd hh:mm:ss で表示
let g:netrw_timefmt="%Y/%m/%d %H:%M:%S"
" ヘッダを非表示にする
let g:netrw_banner=0
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
" ============================================================================
"   winresizer
" ============================================================================
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" ============================================================================
"   vim-table-mode
" ============================================================================
let g:table_mode_corner='|'
" ============================================================================
"   sonictemplate-vim
" ============================================================================
" :help sonictemplate-vim-writetemplate
" ln -s path/to/dotfiles/vim/template ~/.config/nvim/template
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/template']
" ============================================================================
"   ale
" ============================================================================
" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }
" 各ツールをFixerとして登録
let g:ale_fixers = {
    \ 'python': ['autopep8'],
    \ }
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
" 使用するgrep
let mygrepprg = 'grep'
"折りたたみを無効にする
let QFixHowm_Folding = 0
" 日本語が含まれる場合のgrep指定
let myjpgrepprg = ''
" QuickFixウィンドウから開いた後ウィンドウを閉じる
let QFix_CloseOnJump = 1
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
" =====================================================================
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

" a custom vim functe to open preview page
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
"<Plug>MarreviewStop
"<Plug>MarkdownPreviewToggle

" short-cut example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" ============================================================================
"   WindowsのGVimの:terminalから色々なシェルを使う
"   https://qiita.com/shiena/items/1dcb20e99f43c93837
" ============================================================================
function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
           'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_startでgit for windowsのbashを実行する
    call termopen(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_name': 'Git',
                \ 'term_finish': 'close',
                \ 'curwin': v:true,
                \ 'cwd': ERPROFILE,
                \ 'env': l:env,
                \ })

endfunction

nnoremap <Leader>g :<C-u>call GitBash()<CR>

" ============================================================================
"   vim-airline
"   https://github.com/vim-airline/vim-airline
"   https://github.com/vim-airline/vim-airline-themes   
" ============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='base16_colors' 
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" =====================================================================
" vim-gitgutter
" ============================================================================
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
let g:gitgutter_highlight_lines = 1

