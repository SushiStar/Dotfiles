"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'rhysd/vim-clang-format', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}

Plug 'sainnhe/forest-night'

Plug 'vim-airline/vim-airline'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'valloric/youcompleteme', {'for': 'python'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'cpp',
            \'vim', 'yaml', 'tex', 'cc', 'h', 'hpp', 'cmake']}

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

" clang-format ##################################################
let g:clang_format#detect_style_file = 1
" let g:clang_format#auto_format = 1

" airline  ######################################################
let g:airline_theme = 'forest_night'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#nerdtree_status = 0
let g:airline#extensions#coc#enabled = 0

" color #########################################################
set termguicolors
set background=dark
let g:forest_night_enable_italic = 1
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme forest-night

" enhanced cpp highlight ########################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" coc ###########################################################
set hidden
set nobackup
set updatetime=300
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" fzf ###########################################################
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = {'down': '~35%'}

" floaterm ###########################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8

" python-mode ##################################################
let g:pymode_virtualenv = 1
let g:pymode_lint_ignore = ["W","E501"]
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_rope_completion = 0
let g:pymode_lint_cwindow = 0

"youcompleteme #######################################################
let g:ycm_filetype_whitelist = {'python':1, 'cpp':0, 'cc':0, 'h':0}
let pipenv_venv_path = system('pipenv --venv')
if v:shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = (venv_path . '/bin/python')
else
  let g:ycm_python_binary_path = 'python'
endif
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
