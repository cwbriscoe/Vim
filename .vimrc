version 6.0

" setup runpaths for environments
if has ("unix")
    let $VIMPATH="~/.vimfiles/.vim"
    set runtimepath=$VIMPATH,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
elseif has("win32")
    let $VIMPATH="$HOME/Vimfiles/.vim"
    set runtimepath=$VIMPATH,$VIMRUNTIME
endif

" setup pathogen to load plugin bundles
call pathogen#runtime_append_all_bundles()

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim

map! <S-Insert> <MiddleMouse>
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <S-Insert> <MiddleMouse>j

let &cpo=s:cpo_save
unlet s:cpo_save

" Mappings { 
    let mapleader = ","
    nmap <silent> <Leader>t :NERDTreeToggle<RETURN>
    nmap <silent> <Leader>f :FufCoverageFile<CR>
    map <F5> :YRShow<CR>
    map <F9> :tabnext<CR>
    map <S-F9> :tabprev<CR>
    map th :tabprev<CR>
    map tl :tabnext<CR>
    map tn :tabnew<CR>
    map td :tabclose<CR>
    map <C-J> <C-W>j<C-W>
    map <C-K> <C-W>k<C-W>
    map <C-H> <C-W>h<C-W>
    map <C-L> <C-W>l<C-W>
    nnoremap ; :
    inoremap jj <ESC>
" }           

" EasyMotion mappings
let g:EasyMotion_leader_key = '<Leader>,'

" Yankring settings
let g:yankring_enabled=0

" Supertab and Clang Autocomplete settings
set completeopt=menu,menuone,longest
set pumheight=15
let g:SuperTabDefaultCompletionType="context"
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_use_library=1

" NERDTree settings
let g:NERDTreeWinPos="right"
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Disable arrow keys to force myself to learn the Vim way
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

syntax on
set nocompatible
set hidden
set autoread
set showmatch
set vb t_vb=
set ruler
set nomodeline
" set virtualedit=all
" set cursorline " highlight current line
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set mouse=a
set printoptions=paper:letter
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set window=33
set wmh=0

" GUI settings
set guioptions-=T " remove toolbar
set guioptions+=m " enables menubar
set guioptions-=r	" right scrollbar
set guioptions-=R " right scrollbar split
set guioptions-=l " left scrollbar
set guioptions-=L " left scrollbar split
set guifont=DejaVu\ Sans\ Mono\ Bold\ 16

" Tab/Indent settings
set ts=2 sts=2 sw=2 expandtab
set autoindent
set smartindent
set colorcolumn=80

" Search Settings
set incsearch
set hlsearch

" Enable filetype plugin
filetype plugin on
filetype indent on

" Show whitespace toggle
nmap <silent> <leader>l :set list!<CR> " Shortcut to rapidly toggle set list
set listchars=tab:?\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Backup settings
set nobackup
set nowritebackup
set noswapfile

" Sound settings
set noerrorbells
set novisualbell

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Autoadjust quickfix window to fit contents or maximum of 8 lines
" and a minimum of 1 lines
au FileType qf call AdjustWindowHeight(1, 8)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Windows overrides
if has("win32")
    let winhelpfile='windows.hlp'
    map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
    set guifont=Consolas:h14:b:cANSI
endif

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default 
                    " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still 
                  " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                  " open folds 
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }

    set foldtext=SimpleFoldText() " Custom fold text function 
                               " (cleaner than default)
" }

" Color scheme
set t_Co=256
" set t_Co=88
" set t_Co=16
colorscheme _jellybeans

" Load scripts
so $VIMPATH/scripts/statusbar.vim

