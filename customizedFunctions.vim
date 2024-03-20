"customized configuration #############################################
filetype plugin indent on
syntax on
set nocompatible
set omnifunc=syntaxcomplete#Complete
set completeopt+=preview

" set linebreak
set textwidth=100
set wrapmargin=2
" set showbreak=+++
set colorcolumn=100
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap+=h,l
set splitbelow
set splitright
set switchbuf+=useopen,usetab,newtab

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
set laststatus=0
set t_Co=256
set showtabline=2
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold guibg=None guifg=#eb8f34
autocmd ColorScheme * highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red
autocmd ColorScheme * highlight TabLine guifg=#595756 guibg=None
autocmd ColorScheme * highlight TabLineSel  gui=bold guifg=#eb8f34 guibg=None

autocmd FileType c,cc,cpp,h,hh,hpp setlocal comments-=:// comments+=f://

let mapleader = " "
nnoremap <silent> <Tab> gt
nnoremap <silent> <S-Tab> gT
nnoremap <silent> <C-l> :winc l<Enter>
nnoremap <silent> <C-h> :winc h<Enter>
nnoremap <silent> <C-k> :winc k<Enter>
nnoremap <silent> <C-j> :winc j<Enter>
nnoremap <silent> <leader>a :set invnumber invrelativenumber <CR>
tnoremap <Leader>q <C-\><C-n>

set autoread
set timeoutlen=1000 ttimeoutlen=10
autocmd BufWritePre * :%s/\s\+$//e

" for orgmode
set conceallevel=2

" quickfix window size
autocmd FileType qf resize 20

" port the result into the quickfix window
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m
command! -nargs=+ RG silent! grep <args> | cwindow
