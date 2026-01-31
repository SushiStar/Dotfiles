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
Plug 'nvim-lualine/lualine.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'olimorris/persisted.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-neorg/neorg', { 'do': 'Neorg sync-parsers' } |
" Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ruifm/gitlinker.nvim'
" Plug 'CopilotC-Nvim/CopilotChat.nvim'

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

" let g:everforest_background = 'hard'
" let g:everforest_enable_italic = 1
" let g:everforest_cursor = 'auto'
" let g:everforest_diagnostic_text_highlight = 1
" let g:everforest_diagnostic_line_highlight = 1
" let g:everforest_better_performance = 0
" colorscheme gruvbox-material

lua << EOF
-- GitSigns #######################################################
require('gitsigns_config')
require('nvim-autopairs').setup{}
-- require('neorg_config')
require('treesitter_config')
require('lsp_config')
-- require('copilot_chat_config')
require('github_theme')
require('keymap_config')
require('persisted_config')

-- Define a function to get the current time
local function get_current_time()
  return os.date('%H:%M:%S')  -- Format time as HH:MM:SS
end

local function relative_filepath()
  return vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')  -- Relative to the current directory
end

-- Set up lualine with time on the right side
require('lualine').setup({
  options = {
    theme = 'github_dark_dimmed',  -- Use github_dark_dimmed color scheme
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { relative_filepath },
    lualine_x = { 'location' },
    lualine_y = { get_current_time },
    lualine_z = {  }  -- Display time on the far right
  },
})

-- Refresh the time every second
local timer = vim.loop.new_timer()
timer:start(0, 1000, vim.schedule_wrap(function()
  require('lualine').refresh()  -- Force lualine to refresh
end))

require"gitlinker".setup({
  opts = {
    remote = "origin", -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- print the url after performing the action
    print_url = true,
  },
})

EOF
