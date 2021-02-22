"customized configuration #############################################
filetype plugin on
filetype indent on

" set linebreak
set textwidth=90
set wrapmargin=2
set formatoptions-=t
set showbreak=+++
set colorcolumn=90
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap+=h,l
set splitbelow

set ignorecase
set smartcase
set incsearch
set noshowmode
set nohlsearch
set autoindent

"numbers
set number
set relativenumber
set cursorline
set fillchars=vert:│
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold guibg=None guifg=#eb8f34
autocmd ColorScheme * highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red
autocmd ColorScheme * highlight TabLine guifg=#595756 guibg=None
autocmd ColorScheme * highlight TabLineSel  gui=bold guifg=#eb8f34 guibg=None
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

let mapleader = " "
nnoremap <silent> <Tab> gt
nnoremap <silent> <S-Tab> gT
nnoremap <silent> <C-l> :winc l<Enter>
nnoremap <silent> <C-h> :winc h<Enter>
nnoremap <silent> <C-k> :winc k<Enter>
nnoremap <silent> <C-j> :winc j<Enter>
nnoremap <silent> <leader>a :set invnumber invrelativenumber <CR>
nnoremap <silent> <Leader>t :FloatermToggle<CR>
tnoremap <Esc> <C-\><C-n>

set autoread
set timeoutlen=1000 ttimeoutlen=10
