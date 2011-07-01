" ##### info #####
"
"
" compiled by: vagubunt
" http://vagubunt.wordpress.com
" last update: 25.06.11


" ##### OPTIONS #####

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype indent plugin on

" These are highly recommended options.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Viminfo File
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:100,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Backup options
set backupdir=~/tmp
set dir=~/tmp

" when enter or o in a comment line, vim automatically inserts the comment
" char in the new line. Disable it!

" History options
set history=1000  " Number of things to remember in history.

" automatically read file changed outside of Vim
set autoread

" automatically change the working dir to current buffer's
set acd

" # Visual options

" UI options
if has("gui_running")
    colorscheme zmrok
else
    colorscheme xterm16
endif

"cursors dont blink!
set gcr=a:blinkwait0

" set Vim to 256 colors:
set t_Co=256

" Display line numbers on the left
set nu

" Show partial commands in the last line of the screen
set showcmd

" show matching bracket
set showmatch

" Set the command window height to 2 lines
set cmdheight=1

" This makes more sense than the default of 1
set winminheight=0

" minimum winheight of active window
set winheight=10

set winwidth=79
set winminwidth=10

" Line wrapping off
set nowrap
" but don't split words
set lbr

" Explanation needed? :)
set showmode

" set charracters for whitespaces, etc..
set listchars=tab:>-,extends:>,precedes:<

" No noise just a little flashy
set visualbell

" shorten messages + no welcome screen at startup; see :h shortmess for more
" info
set shortmess=atI

" FOLD options

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" automatically fold code depending on syntax highlighing
set foldmethod=indent
set fillchars=vert:\|,fold:\ ,diff:-

" SYNTAX

" Enable syntax highlighting
syntax on

" STATUSLINE options
set statusline= "clear it first
set statusline+=%n:		" - buffer number, followed by a colon
set statusline+=%<%f		" - relative filename, truncated from the left
set statusline+=\ 		" - a space
set statusline+=%h		" - [Help] if this is a help buffer
set statusline+=%m		" - [+] if modified, [-] if not modifiable
set statusline+=%r		" - [RO] if readonly
set statusline+=\ 		" - a space
set statusline+=\ 		" - a space
set statusline+=%=		" - right-align the rest
set statusline+=%-10.(%l,%c%V%) " - line,column[-virtual column]
set statusline+=\ 		" - a space
set statusline+=%4L		" - total number of lines in buffer
set statusline+=\ 		" - a space
set statusline+=%P		" - position in buffer as percentage

" Always display the status line, even if only one window is displayed
set laststatus=2


" # FORMATTING options

" INTENDATION options

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.

set autoindent
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.

" Intendation (4 = RoR default)
set shiftwidth=4

" same (Spaces feel like Tabs)
set softtabstop=4

" Tab converted to spaces
set expandtab

" when at 3 spaces, and I hit > ... go to 4, not 5
set shiftround
set smarttab

" # Navigation options

" move freely between files
"set whichwrap=b,s,h,l,<,>,[,]

" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

" Enable error files & error jumping
set cf
" nice errorlisting in that quickfix Window
"setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%Csymbol\ \ :\ %m,%-C%.%#

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start


" # Search options

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set incsearch " do highlight as you type your search phrase

" # Misc options

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" we have a fast terminal :)
set ttyfast
set ttyscroll=3 " speed
set lazyredraw " to avoid scrolling problems
set scrolloff=5 " keep cursor distanced 5 lines till window ends

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=longest,list:full

" Completion settings in insertmode
set complete=.,w,b,t,i
set completeopt=menuone

" Accept macros within macros
set remap

" Copy to Clipboard (on Unix)
set clipboard+=unnamed
set clipboard+=+

" ##### MAPPING #####

" additional esc's for ins mode.
" note: ctrl [ or ctrl c work also as esc
inoremap kj <esc>
inoremap jk <esc>

" nice buffer switching
nnoremap <leader>bb :ls<cr>:b<space>

let mapleader=","

" General mapping

" delete char after cursor in insert mode, same as del key
inoremap <c-d> <c-o>x

" cd to current buffer's cwd, disabled because of acd
"map <leader>cd :cd %:p:h<CR>:pwd<CR>

" center match
map n nzz
map N Nzz

" faster viewport moving
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" jump to line AND column
nnoremap ' `
nnoremap ` '

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>

" Open help for word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>

" Enables you to save files with :w!! by using sudo if you forgot to open it as root
cmap w!! %!sudo tee > /dev/null %

" Remap gf to open a new split for the file under cursor
map gf <C-W>f

" go to declaration if cursors on an instance / variable...
map gc gdb<C-W>f

" # Movement mapping

" Copy Paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

map <Space> /

" Remap Enter in normal mode

" Stay at the old line with STRG Enter
nmap <c-cr> o<Esc>0c$<Esc>k

" Stay at this line and insert a new line above with Shift Enter
nmap <s-cr> O<Esc>0c$<Esc>j


" Buffer movement

" move to next or previous buffer with ALT+hl
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>

" quickfix reuses open windows
set switchbuf=useopen


" disable search highlighting till next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" Window movement
noremap <silent> <right> <c-w>l
noremap <silent> <down> <c-w>j
noremap <silent> <up> <c-w>k
noremap <silent> <left> <c-w>h

" remap Y to behave like C or D...
map Y y$

" FILE OPERATIONS
"
" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>:so ~/.gvimrc<cr>

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" write & close buffer with alt+q but dont close window
map <m-q> <esc>:w<bar>:BD<cr>
map <c-q> <esc>:BD<cr>


" MANIPULATING movement

" Nice Indentation by Shift-h/l
nmap < <<
nmap > >>
vmap < <gv
vmap > >gv


" Toggle Wrapping
nmap <leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    call DisableDisplayWrapping()
  else
    call EnableDisplayWrapping()
  endif
endfunction

function! EnableDisplayWrapping()
  if !&wrap
    setlocal wrap
    " don't skip wrapped lines
    nnoremap <buffer> k gk
    nnoremap <buffer> j gj
    inoremap <buffer> <Up> <C-O>gk
    inoremap <buffer> <Down> <C-O>gj
  endif
endfunction

function! DisableDisplayWrapping()


  if &wrap
    setlocal nowrap
    nunmap <buffer> k
    nunmap <buffer> j
    iunmap <buffer> <Up>
    iunmap <buffer> <Down>
  endif
endfunction


" PLUGIN MAPPING

map <silent> <leader>ac :exec "Ack ".expand("<cword>")<CR>
map <silent> <leader>ak :Ack 

" exchange ~/django with path to your project
map <leader>fa :cd ~/django<cr>:FufCoverageFile<cr>
map <leader>ff :FufFile<cr>
map <leader>fh :FufHelp<cr>
map <leader>ft :FufBufferTagAll<cr>
map <leader>fd :FufDir<cr>
map <leader>fc :FufCoverageFile<cr>

let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_fuzzyRefining = 1
let g:fuf_splitPathMatching = 1

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:pyref_mapping = 'K'

map <leader>mr :Mru<cr>

nnoremap <silent> <F2> :TagbarToggle<CR>

map <F3> :NERDTreeToggle<CR>

" PLUGIN SETTINGS

let g:tagbar_autoclose = 1

let g:tagbar_width = 30

let g:tagbar_ctags_bin='/usr/bin/ctags'

let g:SuperTabDefaultCompletionType = "context"

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

nnoremap <silent> <Leader>sy :YRShow<CR>

"quickfix window toggle

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

autocmd FileType html set filetype=htmldjango.html
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ softtabstop=4 textwidth=79
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType html,xhtml,htmldjango setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%Csymbol\ \ :\ %m,%-C%.%#

