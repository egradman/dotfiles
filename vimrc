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

set clipboard=unnamed
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

let g:rerun_pane=2
let g:rerun_command="echo 'use let g:rerun_command to set your command'"

map <Leader>r :let g:VimuxRunnerPaneId=g:rerun_pane<CR>:call VimuxSendKeys("C-c")<CR>:call VimuxRunCommand(g:rerun_command)<CR>

autocmd BufRead scp://* :set bt=acwrite
autocmd BufWritePost scp://* :set bt=

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
