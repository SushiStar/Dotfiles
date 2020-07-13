"customized configuration #############################################
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

" trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
