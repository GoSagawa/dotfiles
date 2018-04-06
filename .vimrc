
let mapleader = "\<Space>"

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/gsagawa/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/gsagawa/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


"--------------------------------------------------------------------------
"display setting
set number
set autoindent
set incsearch
set hlsearch
set showmatch

set clipboard=unnamed,autoselect

"vimfiler {{{
 
"vim$B%G%U%)%k%H$N%(%/%9%W%m!<%i$r(Bvimfiler$B$GCV$-49$($k(B
let g:vimfiler_as_default_explorer = 1
"$B%;!<%U%b!<%I$rL58z$K$7$?>uBV$G5/F0$9$k(B
let g:vimfiler_safe_mode_by_default = 0
"$B8=:_3+$$$F$$$k%P%C%U%!$N%G%#%l%/%H%j$r3+$/(B
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"$B8=:_3+$$$F$$$k%P%C%U%!$r(BIDE$BIw$K3+$/(B
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
 
"$B%G%U%)%k%H$N%-!<%^%C%T%s%0$rJQ99(B
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction
 
"}}}
