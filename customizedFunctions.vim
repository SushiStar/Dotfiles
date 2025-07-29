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
set switchbuf+=usetab,newtab,useopen

set ignorecase
set smartcase
set incsearch
set noshowmode
" set nohlsearch
set autoindent
set spelllang=en_us

"numbers
set number
set relativenumber
set cursorline
set fillchars=vert:│
set laststatus=3
" set noruler
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
nnoremap ; :

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

" set netrw cursor cache
let g:netrw_browse_split = 0
let g:netrw_liststyle = 0
let g:netrw_keepdir = 1

lua << EOF

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

local netrw_group = vim.api.nvim_create_augroup("NetrwLineNumbers", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = netrw_group,
    pattern = "netrw",
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end
})

-- Open Netrw if Neovim is started without a file
-- check cmdline arguments
local function is_file_or_directory(path)
    local stat = vim.loop.fs_stat(path)
    return stat and (stat.type == "file" or stat.type == "directory")
end

local function check_arguments_for_files_or_directories()
    for i = 1, #vim.v.argv do
        local arg = vim.v.argv[i]
        if is_file_or_directory(arg) then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        if not check_arguments_for_files_or_directories() then
            vim.cmd('Explore')
        end
    end
})

-- Delete non active buffers if not loaded
local function delete_non_active_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not (vim.api.nvim_buf_is_loaded(buf) or vim.b[buf].active) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

-- Create a custom command to run the function
vim.api.nvim_create_user_command('DeleteNonActiveBuffers', function()
  delete_non_active_buffers()
end, {})

vim.api.nvim_create_user_command(
  'GS',  -- Command name
  function()
    require('gitsigns').toggle_current_line_blame()
  end,
  {}  -- Optional command options
)

-- Create an augroup for managing search highlighting
vim.api.nvim_exec([[
augroup AutoHighlighting
    autocmd!
    autocmd CmdlineEnter /,\? set hlsearch
    autocmd CmdlineLeave /,\? set nohlsearch
augroup END
]], false)




EOF
