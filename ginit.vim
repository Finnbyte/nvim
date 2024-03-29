""" This file is read if using nvim-qt.

" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! Cascadia Code:h14,consolas:h14
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

if exists(':GuiAdaptiveStyle')
    GuiAdaptiveStyle Fusion
endif

highlight Normal ctermbg=235 guibg=#282828
" Right Click Context Menu (Copy-Cut-Paste)
"nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
"inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
"xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
