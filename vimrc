filetype plugin indent on

execute pathogen#infect()

set number

" show existing tab with 4 sapces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 sapces
set expandtab

set autoindent

set background=dark

syntax enable

colorscheme flattown


" hide the status line
let &l:statusline='%{getline(line("w$")+1)}'
