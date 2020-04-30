"##### plugins ##############
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Decclare the list of plugins.
Plug 'jiangmiao/auto-pairs'

Plug 'valloric/youcompleteme'

Plug 'vim-scripts/cmake.vim-syntax'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'

Plug 'rhysd/vim-clang-format'

Plug 'haya14busa/incsearch.vim'

Plug 'scrooloose/nerdtree'

Plug 'sainnhe/gruvbox-material'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'miyakogi/conoline.vim'

Plug 'yggdroot/indentline'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" conoline ##########################
let g:conoline_auto_enable = 1

" NERDTREE ###########################
" OPEN NERDTree automatically when vim starts*****
" autocmd vimenter * NERDTree
" OPEN NERDTree automatically when vim starts a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"open a NERDTree automatically when vim starts up if no files were specified
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=35

" incserach ###############################
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set nohlsearch

" NerdCommenter ################################ 
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy

" youcompleteme ###########################
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tag_files=1
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

"#### terminal configuration ##########
filetype plugin on
syntax enable

set backspace=2
set number

" show existing tab with 4 sapces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 sapces
set expandtab

set whichwrap+=h,l

" ctags refresh
map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

nnoremap <silent> <C-n> :tabnew<Enter>
nnoremap <silent> <C-p> :vnew<Enter>
nnoremap <silent> <C-s> :new<Enter>
"nnoremap <silent> <C-a> :x<Enter>

nnoremap <silent> <C-H> gT
nnoremap <silent> <C-L> gt
nnoremap <silent> fl :winc l<Enter>
nnoremap <silent> fh :winc h<Enter>
nnoremap <silent> fk :winc k<Enter>
nnoremap <silent> fj :winc j<Enter>

set ignorecase
set autoread
set cursorline
set timeoutlen=1000 ttimeoutlen=10

" lightline #############################################
"set noshowmode
"let g:lightline = {'colorscheme' : 'codedark'}
let g:lightline = {'colorscheme' : 'gruvbox_material'}
"let g:lightline = {'colorscheme' : 'solarized'}

" clang-format ########################################## 
let g:clang_format#code_style='llvm'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" color ################################################ 
set termguicolors  
set background=dark
"set background=light
colorscheme gruvbox-material
"colorscheme codedark
"colorscheme solarized8_flat
let g:gruvbox_contrast_dark='soft'
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ack ####################################################
let g:ackprg = 'ag --nogroup --nocolor --column'

" enhanced cpp highlight #################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

set viminfo="NONE"
