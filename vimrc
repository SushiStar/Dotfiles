"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-scripts/DoxygenToolkit.vim', {'for': 'cpp'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax', {'for':'python'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'

Plug 'yggdroot/indentline', {'for':['python', 'cpp']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'

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
" close vim automatically when nerdtree is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" have the same nerdtree on every tab automatically
autocmd BufWinEnter * silent NERDTreeMirror

" airline  ######################################################
" let g:airline_theme = 'gruvbox_material'
let g:airline_theme = 'everforest'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#coc#enabled = 1

" color #########################################################
set termguicolors
set background=dark
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" colorscheme gruvbox-material

colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_cursor = 'auto'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1

" coc ###########################################################
set hidden
set nobackup
set updatetime=300
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <Leader>f :call CocAction('format')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" floaterm ######################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8

"indentline #####################################################
let g:indentLine_enabled = 1
let g:indentLine_setConceal=0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"python-syntax ##################################################
let g:python_highlight_all=1

"cpp doxygen keymapping #########################################
autocmd FileType c,cpp,cc,h,hpp nnoremap <silent> <Leader>d :Dox<CR>

"python docstring ###############################################
let g:pydocstring_enable_mapping = 0
let g:pydocstring_formatter = 'google'
autocmd FileType python nnoremap <silent> <Leader>d :Pydocstring<CR>
