"##### plugins ##############

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Decclare the list of plugins.
Plug 'tpope/vim-sensible'

Plug 'somini/vim-autoclose'

Plug 'majutsushi/tagbar'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()



"#### terminal configuration ##########

filetype plugin indent on
syntax enable
syntax on

set backspace=2
set number

" show existing tab with 4 sapces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 sapces
set expandtab

set background=dark

nmap <F8> :TagbarToggle<CR>

set nowrap

set ignorecase




"###### GUI configuration #################

" Set extra options when running in GUI mode
if has("gui_running")

    " remove toolbar
    set guioptions-=m
    "remove menubar
    set guioptions-=T

    set guitablabel=%M\ %t

    set guifont=Monospace\ 11
   
    let g:codedark_conservative = 1
    colorscheme codedark


endif


