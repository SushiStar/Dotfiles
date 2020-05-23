"########################### plugins ################################
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'

Plug 'rhysd/vim-clang-format'

Plug 'sainnhe/gruvbox-material'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'valloric/youcompleteme'

Plug 'Yggdroot/LeaderF'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy

"terminal configuration #############################################
filetype plugin on
set omnifunc=syntaxcomplete#Complete
syntax enable

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap+=h,l

set incsearch
set nohlsearch

"numbers
set number
set relativenumber
set cursorline
nnoremap <silent> <C-a> :set invnumber invrelativenumber <CR>
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold ctermfg=red guifg=#eb8f34
autocmd ColorScheme * highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red
autocmd ColorScheme * highlight CursorLine ctermbg=Black guibg=Black

"nnoremap <silent> <C-t> :Tex<Enter>
nnoremap <silent> <C-p> :Vex<Enter>
nnoremap <silent> <C-s> :Sex<Enter>

nnoremap <silent> <Tab> gT
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

" lightline #####################################################
"let g:lightline = {'colorscheme' : 'gruvbox_material'}
let g:lightline = {
            \ 'colorscheme' : 'gruvbox_material',
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

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
"set background=light
colorscheme gruvbox-material
"colorscheme codedark
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
let g:ycm_collect_identifiers_from_tag_files=1
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_auto_trigger = 1
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]


" leader F #######################################################
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:webdevicons_enable = 1
set encoding=UTF-8
