"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf.vim'

Plug 'rking/ag.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'rhysd/vim-clang-format'

" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'

Plug 'majutsushi/tagbar'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Customized functions ##############################################
source ~/Dotfiles/customizedFunctions.vim

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims=1

"terminal configuration #############################################
filetype plugin on

set backspace=2
set tabstop=2
set shiftwidth=2
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
set fillchars=vert:│
nnoremap <silent> <C-a> :set invnumber invrelativenumber <CR>
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold guibg=None guifg=#eb8f34
" autocmd ColorScheme * highlight CursorLine ctermbg=Black guibg=#5e5e5e
autocmd ColorScheme * highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red
autocmd ColorScheme * highlight TabLine guifg=#595756 guibg=None
autocmd ColorScheme * highlight TabLineSel  gui=bold guifg=#eb8f34 guibg=None
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

nmap <silent> <Esc>c :call CentreText()<CR>
nmap <silent> <Esc>t :call GetTerm()<CR>
nnoremap <silent> <C-T> :Tex<Enter>
nnoremap <silent> <C-p> :Vex<Enter>
nnoremap <silent> <Esc>e :Explore<CR>

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

let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
let g:netrw_list_hide=ghregex
let g:netrw_liststyle = 3

" trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" clang-format ##################################################
let g:clang_format#code_style='google'
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -1,
			\ "ConstructorInitializerIndentWidth" : 4,
			\ "IndentWidth" : 2,
			\ "UseTab" : "false",
			\ "IndentCaseLabels" : "true",
			\ "NamespaceIndentation" : "None",
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"
      \ }

" color #########################################################
set termguicolors
set background=dark
let g:forest_night_enable_italic = 1
colorscheme forest-night
" colorscheme gruvbox-material
" let g:gruvbox_contrast_dark='dark'
let g:NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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
nmap <silent> <Leader>f :FZF! <CR>
