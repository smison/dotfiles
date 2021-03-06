set number

" 拡張子ごとに別のtabの設定
autocmd BufNewFile,BufRead *.php  setlocal tabstop=8 shiftwidth=8
autocmd BufNewFile,BufRead *.rb   setlocal tabstop=8 shiftwidth=8 expandtab
autocmd BufNewFile,BufRead *.html setlocal tabstop=8 shiftwidth=8
" </で閉じタグを自動補完
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
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
set hlsearch
" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
" vi との互換性OFF
set nocompatible
" シンタックスハイライト
syntax enable
" paragraphをコメントアウト
nnoremap <C-c> <C-v>}k<S-I>#<Esc>jk
" 色
" colorscheme murphy_ex
" スワップファイルをつくらない
set noswapfile

" ===============================================================
" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

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
" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
        NeoBundle 'scrooloose/nerdtree'
        NeoBundle 'Lokaltog/vim-easymotion'
        " Syntastic(構文チェック)
        NeoBundle 'Syntastic'
        NeoBundle 'scrooloose/nerdcommenter'
        NeoBundle 'Shougo/neocomplete.vim'
        NeoBundle 'violetyk/neocomplete-php.vim'
        NeoBundle 'mattn/emmet-vim'
    call neobundle#end()
endif

" ===============================================================
" NERDTree
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
" vim-easymotion(s二回押し+Enterでショートカット)
" http://haya14busa.com/mastering-vim-easymotion/
nmap s <Plug>(easymotion-s2)
" ===============================================================
" NERD-Commenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle
" =============================================================
let g:neocomplete_php_locale = 'ja'
" ================================================================
filetype plugin on
filetype indent on
" offにしていた filetype をon に
filetype on
