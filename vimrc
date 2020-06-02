"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'

Plug 'rhysd/vim-clang-format'

Plug 'sainnhe/gruvbox-material'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'valloric/youcompleteme'

Plug 'ryanoasis/vim-devicons'
call plug#end()

" center text
source ~/shellConfig/centerText.vim
nmap <silent> <Esc>c :call CentreText()<CR>
nmap <silent> <Esc>t :call GetTerm()<CR>

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy

"terminal configuration #############################################
filetype plugin on

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap+=h,l
set splitbelow

set incsearch
set noshowmode
set nohlsearch

"numbers
set number
set relativenumber
set cursorline
nnoremap <silent> <C-a> :set invnumber invrelativenumber <CR>
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold ctermfg=red guifg=#eb8f34
autocmd ColorScheme * highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red
autocmd ColorScheme * highlight CursorLine ctermbg=Black guibg=Black
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

nnoremap <silent> <C-T> :Tex<Enter>
nnoremap <silent> <C-p> :Vex<Enter>

nnoremap <silent> <Tab> gt
nnoremap <silent> <S-Tab> gT
nnoremap <silent> <C-l> :winc l<Enter>
nnoremap <silent> <C-h> :winc h<Enter>
nnoremap <silent> <C-k> :winc k<Enter>
nnoremap <silent> <C-j> :winc j<Enter>

set ignorecase
set autoread
set timeoutlen=1000 ttimeoutlen=10
set linebreak

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python3'

let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" trailing spaces
autocmd BufWritePre * :%s/\s+$//e

" airline ########################################################
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#cursormode#enabled = 0

" clang-format ##################################################
let g:clang_format#code_style='llvm'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" color #########################################################
set termguicolors  
set background=dark
colorscheme gruvbox-material
let g:gruvbox_contrast_dark='soft'
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" enhanced cpp highlight ########################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" youcompleteme #################################################
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_python_binary_path = '/usr/local/Cellar/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments=1

let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_max_diagnostics_to_display = 100
