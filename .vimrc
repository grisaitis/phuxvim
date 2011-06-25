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
set viminfo='10,\"100,:100,%,n~/.viminfo

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
set nobackup
set noswapfile

set formatoptions=l

" History options
set history=1000  " Number of things to remember in history.

" automatically read file changed outside of Vim
set autoread

" change working directory to currently viewed buffer automatically
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /

" # Visual options

" UI options
if has("gui_running")
     colorscheme Django
else
    colorscheme xterm16
endif

" set Vim to 256 colors:
set t_Co=256

" Display line numbers on the left
set nu

" Show partial commands in the last line of the screen
set showcmd

" show matching bracket
set showmatch

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Set the command window height to 2 lines
set cmdheight=1

" no cursor blinking
set gcr=a:blinkon0

" This makes more sense than the default of 1
set winminheight=0

set winwidth=40
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
set statusline+=%{fugitive#statusline()}
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
" Tabs are 4 spaces
set ts=4
" when at 3 spaces, and I hit > ... go to 4, not 5
set shiftround
set smarttab

" indent comments correctly?
set fo+=c

" # Navigation options

" move freely between files
set whichwrap=b,s,h,l,<,>,[,]

" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

" Enable error files & error jumping
set cf
" nice errorlisting in that quickfix Window
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%Csymbol\ \ :\ %m,%-C%.%#

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
set scrolloff=10 " keep 3 lines before the bottom window end"

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=80

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=list:longest,full

" Completion settings in insertmode
set complete=.,w,b,t
"set complete-=i
set completeopt=longest,menuone

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

" dictionary Completion with alt+p
inoremap <m-p> <c-x><c-k>

" Open help for word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>

" Enables you to save files with :w!! by using sudo if you forgot to open it as root
cmap w!! %!sudo tee > /dev/null %

" Remap gf to open a new split for the file under cursor
map gf <C-W>f

" go to declaration if cursors on an instance / variable...
map gc gdb<C-W>f

" # Movement mapping

" arrow keys are evil!!
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Copy Paste
map <leader>p "+gp
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

" paste lines with incrementing/decrementing numbers, especially usefull for array[] rows
nnoremap <leader>up yyp<c-a>
nnoremap <leader>dp yyp<c-x>

" Highlight toggle
nmap <leader>h :set hlsearch! hlsearch?<cr>

" show EOL, Tabs, trailing whitespaces
map <leader>L :set list! list?<cr>
map <Space> /

" Remap Enter in normal mode
" to insert new line below current no matter from which cursor position
"nmap <cr> o<Esc>0c$<Esc>
" Stay at the old line with STRG Enter
nmap <c-cr> o<Esc>0c$<Esc>k
" Stay at this line and insert a new line above with Shift Enter
nmap <s-cr> O<Esc>0c$<Esc>j

" Use the Shift-Space to open and close code folds
" in VISUAL mode Shift-Space folds selected Code
" in NORMAL mode Shift-Space opens/closes fold, if any.
nnoremap <silent> <S-Space> @=(foldlevel('.')?'zA':'l')<CR>
vnoremap <S-Space> zf

" fold a block of code with +
map + v%zf

" Buffer movement

" move to next or previous buffer with ALT+hl
" or firefoxlike with ctrl+tab
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>
nmap <c-tab> :bn<cr>
nmap <c-s-tab> :bp<cr>

" quickfix reuses open windows
set switchbuf=useopen

" Buffer numbers
noremap <A-1> :b 1<cr>
noremap <A-2> :b 2<cr>
noremap <A-3> :b 3<cr>
noremap <A-4> :b 4<cr>
noremap <A-5> :b 5<cr>
noremap <A-6> :b 6<cr>
noremap <A-7> :b 7<cr>
noremap <A-8> :b 8<cr>
noremap <A-9> :b 9<cr>
noremap <A-0> :b 10<cr>

" Window movement

map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-l> <C-W>l
map <c-h> <C-W>h


noremap <silent> <right>  :vertical resize +10<CR>
noremap <silent> <down> :resize +10<CR>
noremap <silent> <up> :resize -10<CR>
noremap <silent> <left> :vertical resize -10<CR>

"" Jump with the cursor through the editing point history
map <c-up> g;
map <c-down> g,

map <m-s> (
map <m-d> )


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
" write & close buffer with alt+q
map <m-q> <esc>:w<bar>:BD<cr>
map <c-q> <esc>:BD<cr>

" get out of INSERT mode with jj
" I've remapped my Capslock-Key to an additional Escape
" If you haven't this could be useful:
" inoremap jj <Esc>


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

let g:closetag_html_style=1

let g:pyref_mapping = 'K'

map <leader>mr :Mru<cr>

map <F2> :TlistToggle<CR>
map <s-F2> :TlistUpdate<CR>

map <F3> :NERDTreeToggle<CR>

nmap <Leader>u :GundoToggle<cr>

let g:pep8_map='<leader>8p'

" Toggle HexHighlighting
map <silent> <leader>xh :call HexHighlight()<cr>

" PLUGIN SETTINGS
let g:SuperTabDefaultCompletionType = "context"
" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'       " point taglist to ctags
let Tlist_GainFocus_On_ToggleOpen = 1      " Focus on the taglist when its toggled
let Tlist_Close_On_Select = 1              " Close when something's selected
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1         " Close folds for inactive files
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Inc_Winwidth = 0

" no popup when entering insert mode
let g:acp_mappingDriven = 0

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" FUzzyFinder
map <m-o> :FufFile<cr>
map <m-b> :FufBuffer<cr>
map <Leader>fh :FufHelp<cr>
map <Leader>fm :FufMruFile<cr>
map <Leader>fc :FufChangeList<cr>

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

nmap <silent> <m-k> :cp<CR>
nmap <silent> <m-j> :cn<CR>

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set filetype=htmldjango
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 omnifunc=pythoncomplete#Complete
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType html,xhtml,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 omnifunc=htmlcomplete#CompleteTags

autocmd Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%Csymbol\ \ :\ %m,%-C%.%#

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" making very magically stuff
map \g :g/\v
map \v :v/\v
map \s :%s/\v
map ,/ /\v
