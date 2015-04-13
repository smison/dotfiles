set number
set tabstop=2
set shiftwidth=2
set autoindent  "autoindentを有効にする
" 不可視文字を表示
"set list
" 不可視文字の表現指定
"set listchars=tab:≫-,trail:-,eol:?,extends:≫,precedes:≪,nbsp:%
" tabを拡張
set expandtab
" インサートモード時にバックスペースを使う
set backspace=indent,eol,start
" 検索の際の大文字小文字区別を賢く判別
set smartcase
" ハイライト検索
:set hlsearch
" vi との互換性OFF
set nocompatible
"syntax on
" paragraphをコメントアウト
nnoremap <C-c> <C-v>}k<S-I>#<Esc>jk
" ===============================================================
" shortcuts
" 編集 :edit $MYVIMRC
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
" リロード :source $MYVIMRC
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
" ヘルプ :help
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><Enter>
" スクリプトを実行
" http://blog.da0shi.com/2014/01/209/
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %
" set number
nnoremap <silent> <C-m> :setlocal number!<CR>
" set paste
function Setpaste()
  if &paste
    setlocal nopaste
    :echo "nopasteモードに設定しました"
  else
    setlocal paste
    :echo "pasteモードに設定しました"
  endif
endfunction
nnoremap <C-k> :call Setpaste()<CR>
" 括弧の自動補完(http://qiita.com/kuwana/items/d9778a9ec42a53b3aa10)
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" 自動補完を常時on
" http://io-fiaablogspot.jp/2012/11/vimvimrc.html
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
" filetype detect
" ===============================================================
" ===============================================================
" ファイル形式の検出を一旦無効にする
filetype off
filetype plugin indent on
" ===============================================================
" ===============================================================
" autocmdの追加により問題が生じないよう、一旦削除
"setlocal cursorline
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
" ===============================================================
" ===============================================================
" vundle
" Vundle を初期化、Vundle 自身も Vundle で管理
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
" ===============================================================

" ===============================================================
" NERD-Tree
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
        NeoBundle 'scrooloose/nerdtree'
    call neobundle#end()
endif
" <F9>でNERDTreeを開く
nmap <F9> :NERDTreeToggle
" <C-n>で次のタブへ
nnoremap <C-n> gt
" <C-p>で前のタブへ
nnoremap <C-p> gT
" Auto launch NERD-Tree unless with args.
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * NERDTree ./
endif
" ===============================================================

" ===============================================================
" vim-indent-guides
"Bundle 'nathanaelkane/vim-indent-guides'
"colorscheme koehler
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=1
" 自動カラーを無効にする
"let g:indent_guides_auto_colors=0
" インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=darkgray
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=darkgray
" ガイドの幅
"let g:indent_guides_guide_size = 1
" ===============================================================

" ===============================================================
" NERD-Commenter
NeoBundle 'scrooloose/nerdcommenter'

" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle
" ===============================================================

" ===============================================================
" vim-ruby
"Bundle 'vim-ruby/vim-ruby.git'
" ===============================================================

" ===============================================================
" Syntastic(構文チェック)
"Bundle 'Syntastic'
" ===============================================================

"================================================================
" offにしていた filetype をon に
filetype on
" ===============================================================
