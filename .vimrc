"##### plugins ############## 
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Decclare the list of plugins.
Plug 'tpope/vim-sensible'

Plug 'somini/vim-autoclose'

Plug 'majutsushi/tagbar'

Plug 'valloric/youcompleteme'

Plug 'scrooloose/nerdtree'

Plug 'vim-scripts/cmake.vim-syntax'

Plug 'scrooloose/nerdcommenter'

Plug 'miyakogi/conoline.vim'

Plug 'bling/vim-airline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" NERDTREE ###########################
" OPEN NERDTree automatically when vim starts*****
"autocmd vimenter * NERDTree
" OPEN NERDTree automatically when vim starts a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"open a NERDTree automatically when vim starts up if no files were specified
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>


" TagBar###############################
let g:tagbar_width = 30


" Conoline ############################
let g:conoline_color_normal_dark = 'guibg=#333333 guifg=#dddddd gui=None '
                           \. 'ctermbg=237'
let g:conoline_color_insert_dark = 'guibg=black guifg=white gui=bold '
                           \. 'ctermbg=237'
let g:conoline_auto_enable = 1


" youcompleteme ##########################
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
"let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_complete_in_comments=1

let g:ycm_collect_identifiers_from_tag_files=1
"set completeopt-=preview 
let g:ycm_seed_identifiers_with_syntax=1


map <F9> :YcmCompleter FixIt<CR>



"#### terminal configuration ##########
filetype plugin on
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

nmap <F8> :TagbarToggle<CR>
" ctags refresh
map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


set ignorecase
let g:codedark_conservative = 1
colorscheme codedark

set autoread


"###### GUI configuration #################

" Set extra options when running in GUI mode
if has("gui_running")

    map <silent> <F11>
                \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

    " remove toolbar
    set guioptions-=M
    "remove menubar
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r

    set guitablabel=%M\ %t

    set guifont=Monospace\ 10


    let g:codedark_conservative = 1
    colorscheme codedark


endif


