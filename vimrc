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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
"NERDcommenter
Plugin 'scrooloose/nerdcommenter'

" Shell inside VIM !
Plugin 'jewes/Conque-Shell'

call vundle#end()
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
"set hlsearch
"set tabstop=4
set clipboard=unnamed
set tabstop=4 shiftwidth=4 expandtab

"syntax on
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
"syntax enable
syntax on
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"For airline
let g:airline#extensions#tabline#enabled = 1
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

"Easy tab navigation
map <S-Right> :tabn<CR>
map <S-Left>  :tabp<CR>
"Easy buffer(tab) navigation
map <S-A-Right> :bn<CR>
map <S-A-Left>  :bp<CR>

"For Undo
map <C-z> :u<CR>

"For searcing with Crtl + F
"":map <C-f> :vimgrep /<C-R><C-W>/ **<left><left><left>
map <C-f> :call VIMGREP("/<C-R><C-W>/", "**")<left><left><left>
map <S-f> :call VIMGREP("/<C-R><C-W>/", @%)<left><left><left>

:fu! VIMGREP(greppattern, greppath)
	exe "vimgrep ".a:greppattern." ".a:greppath
	exe "copen"
endfu

""For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For shell 
autocmd BufEnter * silent! lcd %:p:h
"map <leader>s :ConqueTermSplit bash<CR>
