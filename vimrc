"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'rhysd/vim-clang-format'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" Customized functions ##############################################
source ~/Dotfiles/customizedFunctions.vim

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims=1

" NerdTree config ###############################################
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=41
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowLineNumbers=1
let NERDTreeDirArrowExpandable=''
let NERDTreeDirArrowCollapsible=''
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" clang-format ##################################################
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" airline  ######################################################
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#nerdtree_status = 0

" color #########################################################
set termguicolors
set background=dark
colorscheme gruvbox-material
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" enhanced cpp highlight ########################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" floaterm ###########################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8
