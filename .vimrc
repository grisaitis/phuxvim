" ##### info #####
"
"
" compiled by: vagubunt
" http://vagubunt.wordpress.com
" last update: 04.07.11


" ##### OPTIONS



" --- General Options

" These are highly recommended options.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Backup options
" not needed cause :w<cr> or c-s became native after every change
"set backupdir=~/tmp
"set dir=~/tmp
set nobackup
set nowritebackup
set noswapfile



" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
filetype indent plugin on

" automatically read file changed outside of Vim
set autoread

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Copy to Clipboard (on Unix)
set clipboard+=unnamed
set clipboard+=+

" use open windows for buffer switching
set switchbuf=useopen

" got scrolling options? uncomment this
set ttyfast
set ttyscroll=1 " speed
set lazyredraw " to avoid scrolling problems

" show stuff at the left if not wrapping
set sidescrolloff=5
set sidescroll=1

" keep cursor distanced 3 lines till window ends
set scrolloff=3

" jump to last cursor position when opening files
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

" --- History Options

" Viminfo File
" Tell vim to remember certain things when we exit
"  '50  :  marks will be remembered for up to 50 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :100  :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='50,\"100,:100,n~/.viminfo

" History options
set history=1000  " Number of things to remember in history.

" persistent Undo FTW
set undofile
set undodir=~/.undofilesvim


" ##### VISUAL



" Show partial commands in the last line of the screen
set showcmd

" show matching bracket
" disabled to increase performance
"set showmatch
"set matchtime=2 " how many tenths of a second to blink matching brackets for

" Line wrapping off
set nowrap
" but don't split words
set lbr

set textwidth=79

" Set the command window height to 1 lines
set cmdheight=1

" This makes more sense than the default of 1
set winminheight=0

" set charracters for whitespaces, etc..
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" shorten messages + no welcome screen at startup; see :h shortmess for more
" info
set shortmess=atIoOTts

" Enable syntax highlighting
syntax on

"no bells; if you want visual message type => set visualbell
set visualbell t_vb=


" --- Cursor Options

set cul



" --- Color Options
if has("gui_running")
    colorscheme lanai
    "cursors dont blink!
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=a:blinkon0
    highlight Cursor guifg=black guibg=green
    highlight iCursor guifg=white guibg=magenta
else
    colorscheme slate
endif



" --- Statusline Options
set statusline= "clear it first

" tim popes statusline
set statusline=\ %n\ [%{winnr()}]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" Always display the status line, even if only one window is displayed
set laststatus=2


" --- Indentation Options

" never change tabstop from default(8), only change shiftwidth and
" softtabstop!

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
set autoindent
set smartindent

" same (Spaces feel like Tabs)
set softtabstop=4
set shiftwidth=4

" Tab converted to spaces
set expandtab

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround


" --- Folding Options

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" automatically fold code depending on syntax highlighing
set foldmethod=indent
set foldlevel=0
"set fillchars=vert:\|,fold:\ ,diff:-



" ##### MOVEMENT



" --- General Movement

" backspace and cursor can go lines up or down
set whichwrap+=<,>,[,],h,l

" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start


" --- Search Options

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" do highlight as you type your search phrase
set incsearch



" ##### COMPLETION



" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=longest,full:list

" Completion settings in insertmode
set complete=.,w,b,t,i
set completeopt=menu,longest,preview



" ##### PLUGIN SETTINGS



" conflicts with ack even in non-python files, so just disable it
let g:pyflakes_use_quickfix = 0

let g:Tb_UseSingleClick = 1
let g:Tb_MapCTabSwitchWindows = 0

au FileType html let b:delimitMate_matchpairs = "(:),[:]"
let delimitMate_matchpairs = "(:),[:],{:}"

let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

let g:fuf_modesDisable = ['quickfix', 'mrufile', 'mrucmd', 'bookmarkfile', 'bookmarkfileadd', 'bookmarkfileaddasselectedtext', 'bookmarkdir', 'bookmarkdiradd', 'filewithfullcwd', 'coveragefilechange', 'changelist', 'coveragefigeregister', 'dirwithcurrentbufferdir', 'buffertagwithselectedtext', 'buffertagwithcursorword', 'buffertag', 'taggedfile', 'line', 'help']



" ##### MAPPINGS


" experimenting
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


"--- General mappings

let mapleader=","

" additional esc's for ins mode.
" note: ctrl [ or ctrl c work also as esc
inoremap kj <esc>
inoremap jk <esc>

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" cd to current buffer's cwd
"map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Copy Paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

nmap <silent> <leader>n :set number!<cr>

map <leader>w :set nowrap!<CR>

" disable search highlighting till next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" Enables you to save files with :w!! by using sudo if you forgot to open it as root
cmap w!! %!sudo tee > /dev/null %

" Remap Enter in insert mode
inoremap <c-cr> <c-o>O

" Remap Enter in normal mode

" Stay at the old line with Shift Enter
nmap <s-cr> o<Esc>0c$<Esc>k

" Stay at this line and insert a new line above with CTRL Enter
nmap <c-cr> O<Esc>0c$<Esc>j

" Use Q for formatting the current paragraph
nmap Q gqap

" fast closing of html tags
imap ;; </<c-x><c-o>

" love substitute! (load search-register, too)
nnoremap <Leader>s q/is//<left>
nnoremap <Leader>S q/i%s//<left>

" global, too! (load search-register, too)
nnoremap <Leader>g q/ig;;<left>
nnoremap <Leader>G q/i%g;;<left>

" --- Remappings:

" Open help for word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>

" nice navigation (ack, grep, helpgrep, quickfix..)
:nnoremap <s-F1>  :helpgrep<space>
" note: ack plugin is mapped to <leader>a
:nnoremap <F2>    :cprev<CR>
:nnoremap <s-f2>  :cpfile<CR>
:nnoremap <F3>    :cnext<CR>
:nnoremap <s-f3>  :cnfile<CR>
map <leader>q :QFix<cr>

nnoremap <space> @q
map <s-space> <c-d>
map <c-Space> <c-u>
imap <s-space> <c-x><c-o>

" Nice Indentation by Shift-h/l
nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>

" remap Y to behave like C or D...
map Y y$

" delete char after cursor in insert mode, same as del key
inoremap <c-l> <del>

" jump to line AND column
nnoremap ' `
nnoremap ` '

" center match
map n nzz
map N Nzz

" Remap gf to open a new split for the file under cursor
map gf <C-W>f

" Window movement
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-h> <c-w>h
noremap <silent> <F4> <c-w><c-w><c-w>_

map <leader>1 :exe 1 . "wincmd w"<cr>
map <leader>2 :exe 2 . "wincmd w"<cr>
map <leader>3 :exe 3 . "wincmd w"<cr>
map <leader>4 :exe 4 . "wincmd w"<cr>
map <leader>5 :exe 5 . "wincmd w"<cr>
map <leader>6 :exe 6 . "wincmd w"<cr>
map <leader>7 :exe 7 . "wincmd w"<cr>
map <leader>8 :exe 8 . "wincmd w"<cr>
map <leader>9 :exe 9 . "wincmd w"<cr>

" Window resizing mappings
map - <C-W>-
map + <C-W>+
map <c-left> <c-w><
map <c-right> <c-w>>

" cicle through windows with ctrl tab
noremap <C-TAB>   <C-W>w
noremap <C-S-TAB> <C-W>W

map <leader>m :marks<cr>

" tabbing
nmap <leader>t :tabnew<cr>

" --- File mappings

" Edit the vimrc file
nmap <silent> <F5> :e $MYVIMRC<CR>
nmap <silent> <S-F5> :so $MYVIMRC<CR>:so ~/.gvimrc<cr>

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" quit buffer and window with alt+q
map <m-q> :bd<cr>
" quit buffer but keep window with ctrl+q
map <c-q> :BD<cr>

" nice buffer switching
" notice enabling wildmode is recommended to tab-complete buffernames with this
nnoremap <leader>l :ls<cr>:b<space>

" move to next or previous buffer with ALT+hl
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>



" ##### PLUGIN MAPPINGS



let g:UltiSnipsListSnippets="<s-tab>"

let g:sparkupNextMapping = '<m-n>'

nnoremap <silent> <F8> :TagbarToggle<cr>

map <s-F8> :NERDTreeToggle<CR>

nmap <silent> <Leader>u :GundoToggle<cr>

map <silent> <c-F1> :exec "Ack! ".expand("<cword>")<cr>
map <leader>a :Ack!<space>

map <leader>f :FufCoverageFile<cr>
map <leader>o :FufFileWithFullCwd<cr>
map <leader>k :FufFileWithCurrentBufferDir<cr>
map <leader>d :FufDirWithFullCwd<cr>
map <leader>i :FufBuffer<cr>
map <leader>j :FufJumpList<cr>


let g:pyref_mapping = 'K'

map <leader>r :Mru<cr>

nnoremap <silent> <F6> :colorscheme pyte<CR>
nnoremap <silent> <s-F6> :colorscheme codeburn<CR>
nnoremap <silent> <F7> :colorscheme darkburn<cr>
nnoremap <silent> <s-F7> :colorscheme lanai<cr>

noremap <silent> <Leader>z :YRShow<CR>

let g:UltiSnipsExpandTrigger="<m-j>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-k>"


" ##### AUTOCMDS



autocmd FileType html set filetype=htmldjango.html
autocmd FileType python set ft=python.django
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
            \ softtabstop=4 textwidth=79
            \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
            \ iskeyword +=.,(
let python_highlight_all=1
autocmd FileType html,htmldjango setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" toggles the quickfix window.
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
let g:jah_Quickfix_Win_Height=10
