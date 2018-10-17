" 参考ページ
" https://qiita.com/hachi8833/items/7beeee825c11f7437f54

" Autohotkey で jj <ESC> を実現 https://rcmdnk.com/blog/2013/08/03/computer-windows-autohotkey/
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>

set clipboard=unnamed,autoselect "クリップボードにも記録
set number
set laststatus=2
set foldmethod=marker
set cursorline      " 現在の行をハイライト
hi clear CursorLine " 上と合わせることで行番号のみハイライト
