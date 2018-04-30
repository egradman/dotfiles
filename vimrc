set nocompatible        " must be first line
execute pathogen#infect()
filetype plugin on
filetype plugin indent on

syntax on
syntax enable

" se background=light
" set background=dark

se sw=2
se ts=2
se softtabstop=2

se expandtab
se lazyredraw
se ttyfast

set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set hidden                      " allow buffer switching without saving
set showmode                    " display the current mode
set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full
set wildignore=*.meta
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set list
set listchars=tab:,.,extends:#,nbsp:. " Highlight problematic whitespace
set cmdheight=2

let g:netrw_silent = 1
let g:python_recommended_style=0
let g:jsx_ext_required = 0

"if has('cmdline_info')
"    set ruler                   " show the ruler
"    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
"    set showcmd                 " show partial commands in status line and
"endif

"if has('statusline')
"    set laststatus=2
"
"    " Broken down into easily includeable segments
"    set statusline=%<%f\    " Filename
"    set statusline+=%w%h%m%r " Options
"    set statusline+=\ [%{&ff}/%Y]            " filetype
"    set statusline+=\ [%{getcwd()}]          " current dir
"    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"endif


let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Space> :w<CR>

nnoremap <Leader>t :Lexplore<CR>

onoremap <silent> j gj
onoremap <silent> k gk

nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>; :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlPBuffer<CR>
nnoremap <silent> <leader>R :CtrlPClearAllCaches<CR>

nmap <leader><Up> <C-w><Up>
nmap <leader><Down> <C-w><Down>
nmap <leader><Left> <C-w><Left>
nmap <leader><Right> <C-w><Right>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <leader>k <C-w><Up>
nmap <leader>j <C-w><Down>

nmap <leader>o <C-w>o
nmap <leader>s <C-w>s
nmap <leader>c <C-w>c

nmap <leader>n :bn<CR>

nmap <leader>h :A<CR>
nnoremap <Leader>g :Gstatus<CR><C-w><C-o>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dll$' }
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_follow_symlinks = 1

set backupdir=/tmp
set directory=/tmp

nmap <F1> <nop>

vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P




"let g:vimwiki_list = [{'path':'~/Dropbox/notes', 'path_html':'~/Dropbox/wiki_export/', 'syntax':'markdown'}]
"let g:vimwiki_folding = 'expr'

"http://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree
"com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)
"
"fun! Lexplore(dir, right)
"  if exists("t:netrw_lexbufnr")
"  " close down netrw explorer window
"  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
"  if lexwinnr != -1
"    let curwin = winnr()
"    exe lexwinnr."wincmd w"
"    close
"    exe curwin."wincmd w"
"  endif
"  unlet t:netrw_lexbufnr
"
"  else
"    " open netrw explorer window in the dir of current file
"    " (even on remote files)
"    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
"    exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
"    if a:dir != ""
"      exe "Explore ".a:dir
"    else
"      exe "Explore ".path
"    endif
"    setlocal winfixwidth
"    let t:netrw_lexbufnr = bufnr("%")
"  endif
"endfun
"
"" absolute width of netrw window
"let g:netrw_winsize = -28
"
"" do not display info on the top of window
"let g:netrw_banner = 0
"
"" tree-view
"let g:netrw_liststyle = 0
"
"" sort is affecting only: directories on the top, files below
"let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
"let g:netrw_altv = 4





