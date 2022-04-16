"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'voldikss/vim-floaterm'
Plug 'sainnhe/gruvbox-material'

Plug 'valloric/youcompleteme'
Plug 'nvim-treesitter/nvim-treesitter'


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


" airline  ######################################################
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#nerdtree_status = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#coc#enabled = 1

" color #########################################################
set termguicolors
set background=dark
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme gruvbox-material

" enhanced cpp highlight ########################################


" coc ###########################################################


" floaterm ###########################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8

