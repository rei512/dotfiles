" ---- 基本 ----
set nocompatible       "vi 互換を切る
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp  "日本語ファイルの文字コード自動判別
set fileformats=unix,dos
set hidden             "未保存でもバッファを切り替えられる
set backspace=indent,eol,start  "BS で何でも消せる
set noswapfile         "スワップファイルを作らない
set nobackup           "~ バックアップを作らない
set undofile           "閉じても undo できる
set undodir=~/.vim/undo
if !isdirectory(&undodir) | call mkdir(&undodir, 'p') | endif
set autoread           "外部で変更されたら読み直す
set mouse=a
if has('clipboard')
	set clipboard=unnamed,unnamedplus  "yank した文字列をクリップボードにコピー
endif

" ---- 表示 ----
syntax on
filetype plugin indent on
set number             "行番号を表示
set cursorline         "カーソル行をハイライト
set showmatch          "対応する括弧を表示
set laststatus=2       "ステータスラインを常に表示
set ruler
set showcmd
set wildmenu           "コマンド補完を一覧表示
set wildmode=longest:full,full
set scrolloff=5        "上下 5 行を残してスクロール
set list               "タブと行末スペースを可視化
set listchars=tab:»\ ,trail:·,nbsp:␣
set background=dark
silent! colorscheme habamax

" ---- インデント ----
set autoindent         "改行時に自動でインデントする
set smartindent
set tabstop=4          "タブを何文字の空白に変換するか
set shiftwidth=4       "自動インデント時に入力する空白の数
"set expandtab          "タブ入力を空白に変換
autocmd FileType python,yaml,toml setlocal expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" ---- 検索 ----
set hls                "検索した文字をハイライトする
set incsearch          "入力中から検索する
set ignorecase         "大文字小文字を区別しない
set smartcase          "大文字を含むときだけ区別する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" ---- 分割 ----
set splitright         "画面を縦分割する際に右に開く
set splitbelow

" ---- その他 ----
" 最後に開いていた位置から再開
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g'\"" | endif
" Makefile はタブ必須
autocmd FileType make setlocal noexpandtab
