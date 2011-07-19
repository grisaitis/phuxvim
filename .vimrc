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

" got scrolling options? uncomment this
set ttyfast
set ttyscroll=3 " speed
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

"cursors dont blink!
"set gcr=a:blinkwait0

" --- Color Options
if has("gui_running")
    colorscheme lanai
else
    colorscheme slate
endif



" --- Statusline Options
set statusline= "clear it first

" tim popes statusline
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

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
set fillchars=vert:\|,fold:\ ,diff:-



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
set wildmode=longest:list

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

let g:UltiSnipsExpandTrigger="<m-j>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-k>"

let g:tagbar_ctags_bin = '/usr/bin/ctags'

let g:tagbar_width = 30

let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'bookmarkfile', 'bookmarkfileadd', 'bookmarkfileaddasselectedtext', 'bookmarkdir', 'bookmarkdiradd', 'filewithfullcwd', 'coveragefilechange', 'coveragefigeregister', 'dirwithcurrentbufferdir', 'buffertagwithselectedtext', 'buffertagwithcursorword']



" ##### MAPPINGS



"--- General mappings

let mapleader=","

" additional esc's for ins mode.
" note: ctrl [ or ctrl c work also as esc
inoremap kj <esc>
inoremap jk <esc>

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" delete char after cursor in insert mode, same as del key
inoremap <c-l> <del>

" cd to current buffer's cwd
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" switch between last and current buffer
map <leader>; :b#<cr>

" Copy Paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

nmap <silent> <leader>n :set number!<cr>

map <leader>w :set nowrap!<CR>

" Enables you to save files with :w!! by using sudo if you forgot to open it as root
cmap w!! %!sudo tee > /dev/null %

" Remap Enter in insert mode
inoremap <c-cr> <c-o>O

" Remap Enter in normal mode

" Stay at the old line with Shift Enter
nmap <s-cr> o<Esc>0c$<Esc>k

" Stay at this line and insert a new line above with CTRL Enter
nmap <c-cr> O<Esc>0c$<Esc>j

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" fast closing of html tags
imap ;; </<c-x><c-o>

" --- Remappings:

" Open help for word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>

" nice navigation (ack, grep, helpgrep, quickfix..)
:nnoremap <F2>  :helpgrep<space>
" note: ack plugin is mapped to <leader>a
:nnoremap <up>    :cprev<CR>
:nnoremap <left>  :cpfile<CR>
:nnoremap <down>    :cnext<CR>
:nnoremap <right>  :cnfile<CR>
:nnoremap <F3>    :copen<CR>
:nnoremap <S-F3>    :ccl<CR>

map <Space> <c-d>
map <s-Space> <c-u>

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

" jump to line AND column
nnoremap ' `
nnoremap ` '

" center match
map n nzz
map N Nzz

" disable search highlighting till next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" Remap gf to open a new split for the file under cursor
map gf <C-W>f

" Window movement
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-h> <c-w>h
noremap <silent> <F4> <c-w><c-w><c-w>_

" Window resizing mappings
map - <C-W>-
map + <C-W>+
map <c-left> <c-w><
map <c-right> <c-w>>

" cicle through windows with ctrl tab
noremap <C-TAB>   <C-W>w
noremap <C-S-TAB> <C-W>W

map <leader>m :marks<cr>
map <leader>j :jumps<cr>

" tabbing
nmap <leader>t :tabnew<cr>

" --- File mappings

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>:so ~/.gvimrc<cr>

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" quit buffer and window with alt+q
map <m-q> :bd<cr>
" quit buffer but keep window with ctrl+q
map <c-q> :BD<cr>

" nice buffer switching
" notice enabling wildmode is recommended to complete buffernames with this
nnoremap <leader>lb :ls<cr>:b<space>

" move to next or previous buffer with ALT+hl
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>



" ##### PLUGIN MAPPINGS



let g:UltiSnipsListSnippets="<s-tab>"

let g:sparkupNextMapping = '<c-j>'

nnoremap <silent> <F8> :TagbarToggle<cr>

nmap <silent> <Leader>u :GundoToggle<cr>

map <silent> <c-F1> :exec "Ack ".expand("<cword>")<cr>
map <leader>a :Ack<space>

map <leader>f :FufCoverageFile<cr>
map <leader>g :FufFileWithFullCwd<cr>
map <leader>o :FufFileWithCurrentBufferDir<cr>
map <leader>d :FufDirWithFullCwd<cr>
map <leader>i :FufBuffer<cr>


let g:pyref_mapping = 'K'

map <leader>r :Mru<cr>

nnoremap <silent> <F6> :colorscheme pyte<CR>
nnoremap <silent> <s-F6> :colorscheme mayansmoke<CR>
nnoremap <silent> <F7> :colorscheme darkburn<cr>
nnoremap <silent> <s-F7> :colorscheme lanai<cr>
map <c-F8> :NERDTreeToggle<CR>

noremap <silent> <Leader>z :YRShow<CR>



" ##### AUTOCMDS



autocmd FileType html set filetype=htmldjango.html
autocmd FileType python set ft=python.django
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
            \ softtabstop=4 textwidth=79
            \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType html,htmldjango setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS



" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


function! Ack(args)
    let grepprg_bak=&grepprg
    set grepprg=ack\ -H\ --nocolor\ --nogroup
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
endfunction

command! -nargs=* -complete=file Ack call Ack(<q-args>)
