" When the GUI starts, t_vb is reset to its default value.
" Reassert that no flash or beep is wanted.
set visualbell t_vb=

set guifont=DejaVu\ Sans\ Mono\ 9

" no GUI
set guioptions-=l "left scrollbar
set guioptions-=r "Right scrollbar
set guioptions-=T " No toolbar
set guioptions-=m " no menu

" Size of GVim window
" using ubuntu 11.04 makes this useless :)
"set lines=55 columns=85


" FOLDING
"highlight folded guibg=purple4 guifg=white


" color background of current line
set cursorline

" Color Visual Text Selection
"
"highlight Visual guibg=steelblue guifg=white

" colorize cursor based on mode:
" initialize
"hi Cursor guibg=green
" swichting
"au InsertEnter * hi iCursor guifg=black guibg=red
"au InsertLeave * hi Cursor guifg=#cfcfcf guibg=#0b0a0a

"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=a:blinkon0

highlight statusline guibg=gray guifg=black
