set number
" set tabstop=2
" set shiftwidth=2
set autoindent  "autoindentを有効にする
" 不可視文字を表示
set list
" 不可視文字の表示形式(tab >---, 半スペ .)
set listchars=tab:--,trail:.
" インサートモード時にバックスペースを使う
set backspace=indent,eol,start
" 検索の際の大文字小文字区別を賢く判別
set smartcase
" ハイライト検索
:set hlsearch
"" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
" vi との互換性OFF
set nocompatible
" シンタックスハイライト
syntax enable
" paragraphをコメントアウト
nnoremap <C-c> <C-v>}k<S-I>#<Esc>jk
" 色
colorscheme murphy_ex
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
" set listのトグル
nnoremap <silent> <C-l> :setlocal list!<CR>
" set numberのトグル
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
" ===============================================================
" ===============================================================
" ファイル形式の検出を一旦無効にする
filetype off
filetype plugin indent on

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
" NERD-Commenter
NeoBundle 'scrooloose/nerdcommenter'

" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle
" ===============================================================

" ===============================================================
" Syntastic(構文チェック)
NeoBundle 'Syntastic'
" ===============================================================

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'violetyk/neocomplete-php.vim'
let g:neocomplete_php_locale = 'ja'

"================================================================
" offにしていた filetype をon に
filetype on
" ===============================================================
