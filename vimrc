"---------------------------------------------------------------------
" Michael Galankis' vimrc
" 04-06-2016 
"---------------------------------------------------------------------

execute pathogen#infect()
syntax on
filetype plugin indent on

"---------------------------------------------------------------------
" General settings
"---------------------------------------------------------------------

set ffs=unix,dos
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Searching
set hlsearch
set incsearch
set showmatch
set ignorecase smartcase
set autoread

" Tab 
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Visual
set cursorline
set number
set so=7

" Backups
set nobackup
set nowritebackup
set noundofile
set noswapfile

" Other
set backspace=indent,eol,start
set wildmode=longest,list,full
set wildmenu
set wildignore=*.log,*.lst
set nocompatible
set noerrorbells
"set autochdir

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

" Netrw
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

" multiple cursors
"let g:multi_cursor_exit_from_visual_mode = 0
"let g:multi_cursor_exit_from_insert_mode = 0


"---------------------------------------------------------------------
" Display
"---------------------------------------------------------------------

set termguicolors
set t_Co=256 " all the colours
set guifont=Consolas:h14

" Colorscheme
colorscheme flattened_light
let g:airline_theme='base16_gruvbox_light_medium'

" Remove toolbar
set guioptions-=T
set guioptions-=m
set guioptions-=r " remove scroll bar

" Status bar
set ruler

"---------------------------------------------------------------------
" Plugin - CtrlP
"---------------------------------------------------------------------

noremap <c-p> :CtrlP<cr>

"---------------------------------------------------------------------
" Plugin - vim-airline
"---------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1

"---------------------------------------------------------------------
" Keybindings
"---------------------------------------------------------------------

let mapleader=","

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>q :q<cr>
noremap <leader>h q:
noremap <leader>s :vsp<cr> 
noremap <leader>w :w<cr> 

noremap <leader>t :b#<cr>
noremap <leader><space> :nohl<cr>
noremap <leader># :e#<cr>
noremap <c-d> yypk

"recent files
"noremap <leader>r :browse oldfiles<cr>q
noremap <leader>r :CtrlPMRUFiles<cr>

" Search
noremap <space> /<bs>v
noremap <s-space> ?<bs>v

" Emacs stuff
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$
inoremap <c-k> <c-o>d$

", Normal paste
inoremap <c-v> <c-r>*

" Navigation
noremap <leader>0 ^
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" emacs style bindings in insert mode
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$

" selection stuff
vnoremap <C-c> "*y 
vnoremap <M-<> <gv
vnoremap <M->> >gv
vnoremap <space> I<Space><Esc>gv

" Saving
map <F2> :'<,'>w! H:\sasfiles\torun.sas <CR>
map <F3> :w! <CR>
imap <F3> <c-o>:w! <CR>

"---------------------------------------------------------------------
" Keybindings - SAS Programming 
"---------------------------------------------------------------------


noremap <leader>cp :let @* = substitute(expand("%:p"),"\\", "/", "g") \| let @* = substitute(@*, "^H\:", "~", "") \| let @* = '"' . substitute(@*, "^P\:", "/projstat", "") . '"'<cr><cr>
noremap <leader>cw :let @* = substitute(expand("%:p"),"\\", "/", "g") \| let @* = '"' . @* . '"' \| echo @* "copied to clipboard"<cr><cr>

" opens log file of sas-file
map <leader>l :sp %:r.log<cr> 


"---------------------------------------------------------------------
" Commands
"---------------------------------------------------------------------

command! CopyPath let @*=expand("%:p")
command! CopyFileName let @*=expand("%:p:h")
"command! SaveDraft write /projstat/nn7170/nn7170-4213/current/stats/program/draft/mzcg/%:t \| edit /projstat/nn7170/nn7170-4213/current/stats/program/draft/mzcg/%:t

function! MySave()
    if b:current_syntax == "sas"
        write 
        write! H:\sasfiles\torun.sas
        echo "SAS saved"
    else
        write 
        echo "saved"
    endif
endfunction

"---------------------------------------------------------------------
" Terminal
"---------------------------------------------------------------------

set shell=powershell
set shellcmdflag=-command
set shellquote=\"
set shellxquote=

tnoremap <c-q> <c-w>:q!<cr>
