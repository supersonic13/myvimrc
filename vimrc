set nocompatible
"set hidden
"set showtabline=0
"set modifiable
set modelines=0
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
"set hlsearch

syntax on
set mouse=a

" NERDTree stuff
" Startup automatically
"autocmd vimenter * NERDTree
"To close NERDTree last
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

"let NERDTreeMapOpenInTab='<ENTER>'
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

"For Ctrl-P
let g:ctrlp_cmd = 'CtrlP'

" FOr solarised
syntax enable
set background=dark
"set t_Co=16
colorscheme solarized

"For airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_alt_sep = '>'

"For delimiters
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
      au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"Easy window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
