"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'vim-scripts/DoxygenToolkit.vim', {'for': 'cpp'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax', {'for':'python'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

"Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
Plug 'sainnhe/everforest'
" Plug 'sainnhe/gruvbox-material'

Plug 'yggdroot/indentline', {'for':['python', 'cpp']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'

" Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go', {'for':'go'}

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
nnoremap <C-n> :NvimTreeToggle<CR>
" let g:NERDTreeWinSize=41
" let g:NERDTreeMinimalUI=1
" let g:NERDTreeShowLineNumbers=1
" let NERDTreeDirArrowExpandable=''
" let NERDTreeDirArrowCollapsible=''
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " close vim automatically when nerdtree is the last window
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" " have the same nerdtree on every tab automatically
" autocmd BufWinEnter * silent NERDTreeMirror

" airline  ######################################################
" let g:airline_theme = 'gruvbox_material'
let g:airline_theme = 'everforest'
" let g:airline_theme = 'github_dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#coc#enabled = 1

" color #########################################################
set termguicolors
set background=dark
" colorscheme gruvbox-material
colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_cursor = 'auto'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1

" let g:github_function_style = "italic"
" let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]
" colorscheme github_dark

" coc ###########################################################
set hidden
set nobackup
set updatetime=300
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <Leader>f :call CocAction('format')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" floaterm ######################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8

"indentline #####################################################
let g:indentLine_enabled = 1
let g:indentLine_setConceal=0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"python-syntax ##################################################
let g:python_highlight_all=1

"cpp doxygen keymapping #########################################
autocmd FileType c,cpp,cc,h,hpp nnoremap <silent> <Leader>d :Dox<CR>

"python docstring ###############################################
let g:pydocstring_enable_mapping = 0
let g:pydocstring_formatter = 'google'
autocmd FileType python nnoremap <silent> <Leader>d :Pydocstring<CR>

" GoLang  #######################################################
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_code_completion_enabled = 0


" LUA for nvim-tree #############################################
lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
    icons = {
        show = {
            folder = false,
            file = false,
            folder_arrow = false,
        },
    },
  },
  actions = {
      change_dir = {
          global = false,
          enable = false,
      },
  },
  filters = {
    dotfiles = false,
  },
  view = {
    width = 40,
    number = true,
    relativenumber = true,
  },
})
-- auto close
local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end


vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})
EOF
