" Vim color file
" Maintainer:   Your name <youremail@something.com>
" Last Change:  
" URL:

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
    hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="own"

hi Normal guibg=#202020 guifg=#FFFFFF

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" :hi Cursor
" gives
"Cursor         xxx guifg=bg guibg=fg 
 
" Uncomment and complete the commands you want to change from the default.

hi Cursor guibg=#990000 guifg=#ffffff
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
"hi VertSplit
"hi Folded
"hi FoldColumn
"hi IncSearch
hi LineNr guifg=#808080 guibg=#111111
hi MatchParen guifg=#d0ffc0 guibg=#2f2f2f gui=bold
"hi ModeMsg
"hi MoreMsg
"hi NonText
"hi Question
"hi Search
"hi SpecialKey
"hi StatusLine
"hi StatusLineNC
"hi Title
"hi Visual
"hi VisualNOS
"hi WarningMsg
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
"hi Comment
"hi Constant
"hi Identifier
"hi Statement
"hi PreProc
"hi Type
"hi Special
"hi Underlined
"hi Ignore
"hi Error
"hi Todo

