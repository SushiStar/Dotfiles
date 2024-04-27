"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

Plug 'burntsushi/ripgrep'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'    "Use tagbar in cases where a function is too long or file is too large

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'projekt0n/github-nvim-theme'
" Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/everforest'

Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'tag': 'v0.9.2'}
Plug 'nvim-neorg/neorg', {'tag': 'v7.0.0'} | Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Customized functions ##############################################
source ~/Dotfiles/customizedFunctions.vim

" NerdCommenter #####################################################
map 'ci <plug>NERDCommenterToggle
map 'cs <plug>NERDCommenterSexy
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims=1

" FZF ##############################################################
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true } }

" color ############################################################
set termguicolors
set background=dark
" colorscheme github_dark

" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_cursor = 'auto'
" let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" colorscheme gruvbox-material

" let g:everforest_background = 'hard'
" let g:everforest_enable_italic = 1
" let g:everforest_cursor = 'auto'
" let g:everforest_diagnostic_text_highlight = 1
" let g:everforest_diagnostic_line_highlight = 1
" let g:everforest_better_performance = 0
" colorscheme everforest

lua << EOF
-- GitSigns #######################################################
require('gitsigns').setup{}
require('nvim-autopairs').setup {}
require('lsp_config')
require('neorg_config')
require('treesitter_config')
require('github_theme')
require('keymap_config')

EOF
