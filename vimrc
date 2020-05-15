"##### plugins ##############
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'

Plug 'rhysd/vim-clang-format'

Plug 'sainnhe/gruvbox-material'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'miyakogi/conoline.vim'

Plug 'myusuf3/numbers.vim'

Plug 'haya14busa/incsearch.vim'

Plug 'tpope/vim-vinegar'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" conoline ##########################
let g:conoline_auto_enable = 1

" incserach ###############################
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set nohlsearch

" NerdCommenter ################################ 
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy

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
set linebreak

" lightline #############################################
let g:lightline = {'colorscheme' : 'gruvbox_material'}

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
let g:gruvbox_contrast_dark='soft'
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" enhanced cpp highlight #################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" Numbers.vim ############################################
nnoremap <silent> <C-a> :NumbersToggle <Enter>

" vinegar show number ####################################
let g:netrw_bufsettings = 'nu'

" coc vim ################################################
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set viminfo="NONE"
