"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'rking/ag.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'vim-python/python-syntax', {'for':'python'}

" Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'

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
" colorscheme gruvbox-material
colorscheme everforest
let g:everforest_background = 'medium'
let g:everforest_enable_italic = 1
let g:everforest_cursor = 'auto'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_better_performance = 1

" let g:github_function_style = "italic"
" let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]
" colorscheme github_dark

" floaterm ######################################################
let g:floaterm_width=0.8
let g:floaterm_height=0.8

"python-syntax ##################################################
" let g:python_highlight_all=1

" FZF Config ####################################################
let g:fzf_action = { 'enter': 'tabnew' }
nnoremap <silent> <Leader>f :FZF<CR>

" AG  Config ####################################################
let g:ag_working_path_mode="r"

" LUA for nvim-tree #############################################
nnoremap <silent> <leader>e :NvimTreeToggle<CR>

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  renderer = {
    group_empty = true,
    icons = {
        show = {
            folder = true,
            file = true,
            folder_arrow = true,
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
    float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
            relative = "editor",
            border = "rounded",
            row = 20,
            col = 40,
            width = 100,
            height = 40,
        },
    },
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

-- clangd configuration ##########################################

-- Setup language servers.
local lspconfig = require('lspconfig')
local cmp = require'cmp'

-- config completion
--[[
vim.g.coq_settings = {
  auto_start = 'shut-up',
  completion = { always = true },
  keymap = {jump_to_mark = "",},
  clients = {
    snippets = {
        warn = {},
        enabled = false,
    },
  },
};
--]]


cmp.setup({
  snippet = {
    expand = function(args)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

lspconfig.clangd.setup({
    capabilities = {require('cmp_nvim_lsp').default_capabilities()},
    filetypes = { "h", "hh", "hpp", "c",  "cc", "cpp"},
    init_options = {
        semanticHighlighting = true,
    },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent=true, noremap=true}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gd', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
    -- vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  end,
})

-- auto close quick fix after selection
vim.api.nvim_create_autocmd(
  "FileType", {
  pattern={"qf"},
  command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})

-- call format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])


--lualine #######################################################
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}




EOF

