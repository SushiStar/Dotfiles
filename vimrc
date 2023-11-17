"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'is0n/fm-nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'numToStr/FTerm.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Customized functions ##############################################
source ~/Dotfiles/customizedFunctions.vim

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims=1

" color #########################################################
set termguicolors
set background=dark

" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_cursor = 'auto'
" let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" colorscheme gruvbox-material

let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_cursor = 'auto'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_better_performance = 0
colorscheme everforest

" AG  Config ####################################################
let g:ag_working_path_mode="r"

lua << EOF
-- GitSigns #######################################################
require('gitsigns').setup()
require('lsp_config')
require('neorg_config')
require('fterm_config')
require('treesitter_config')
require('fm_config')

vim.keymap.set('n', '<Leader>z', ':Fzf<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', ':Vifm<CR>', {silent = true})

vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

EOF
