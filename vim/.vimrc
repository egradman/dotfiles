set nocompatible        " must be first line
execute pathogen#infect()
filetype plugin on
filetype plugin indent on
let g:csv_autocmd_arrange = 1

se background=light

se sw=2
se ts=2
se expandtab

filetype plugin indent on

syntax on
syntax enable
set background=dark

set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set hidden                      " allow buffer switching without saving

set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

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
"set foldenable                  " auto fold code
set list
set listchars=tab:,.,extends:#,nbsp:. " Highlight problematic whitespace

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Space> :w<CR>

nnoremap <Leader>t :Lexplore<CR>
nnoremap <Leader>K :e scp://vagrant@10.0.0.1//opt/kyogen/

onoremap <silent> j gj
onoremap <silent> k gk


cmap w!! w !sudo tee % >/dev/null

nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>; :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlPBuffer<CR>
nnoremap <silent> <leader>R :CtrlPClearAllCaches<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dll$' }
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

set backupdir=/tmp
set directory=/tmp

nmap <F1> <nop>

vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

vmap  <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++


vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

let g:rainbow_conf = {
      \ 'separately' : { 'agsv' : 0 }
      \ }
let g:rainbow_active = 1

nmap <leader>h :A<CR>

function! BuildAndRun()
  if (&ft=='cs')
    silent !~/.vim/play_unity.command
  elseif (&ft=='javascript' || &ft == 'html')
    silent !~/.vim/reload_chrome.command
  elseif (&ft=='markdown')
    execute "silent !~/.vim/open_in_marked.command " . expand('%:p')
  else
    silent !~/.vim/build_and_run_xcode.command
  endif
  redraw!
endfunction

function! Pad(...)
  :w !pad a:0
endfunction
command! -nargs=* Pad call Pad(<q-args>)

nmap <leader>r :call BuildAndRun()<CR>

nmap <leader><Up> <C-w><Up>
nmap <leader><Down> <C-w><Down>
nmap <leader><Left> <C-w><Left>
nmap <leader><Right> <C-w><Right>

nmap <leader>k <C-w><Up>
nmap <leader>j <C-w><Down>

nmap <leader>o <C-w>o
nmap <leader>s <C-w>s
nmap <leader>c <C-w>c

nmap <leader>n :bn<CR>

let g:ags_agargs = {
  \ '--break'             : [ '', '' ],
  \ '--color'             : [ '', '' ],
  \ '--color-line-number' : [ '"1;30"', '' ],
  \ '--color-match'       : [ '"32;40"', '' ],
  \ '--color-path'        : [ '"1;31"', '' ],
  \ '--column'            : [ '', '' ],
  \ '--context'           : [ 'g:ags_agcontext', '-C', '3' ],
  \ '--filename'          : [ '', '' ],
  \ '--group'             : [ '', '' ],
  \ '--heading'           : [ '', '-H' ],
  \ '--max-count'         : [ 'g:ags_agmaxcount', '-m', '2000' ],
  \ '--numbers'           : [ '', '' ]
  \ }

"" looks for DokuWiki headlines in the first 20 lines
"" of the current buffer
"fun IsDokuWiki()
"  if match(getline(1,20),'^ \=\(=\{2,6}\).\+\1 *$') >= 0
"    set textwidth=0
"    set wrap
"    set linebreak
"    set filetype=dokuwiki
"  endif
"endfun
"
"" check for dokuwiki syntax
""autocmd BufWinEnter *.txt call IsDokuWiki()
"
"" user name with which you want to login at the remote wiki
"let g:DokuVimKi_USER = 'egradman'
"
"" password
"let g:DokuVimKi_PASS = 'ieatcode12'
"
"" url of the remote wiki (without trailing '/')
"let g:DokuVimKi_URL  = 'http://104.236.161.86/'
"
"" width of the index window (optional, defaults to 30)
"let g:DokuVimKi_INDEX_WINWIDTH = 40
"
"" set a default summary for :w (optional, defaults to [xmlrpc dokuvimki edit])
"let g:DokuVimKi_DEFAULT_SUM = 'fancy default summary'

syntax on

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:netrw_silent = 1

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

se sw=2
se ts=2
se softtabstop=2
"se rnu
se lazyredraw
se ttyfast

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



set cmdheight=2
let g:python_recommended_style=0
let g:jsx_ext_required = 0

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_follow_symlinks = 1


nnoremap <Leader>g :Gstatus<CR><C-w><C-o>
