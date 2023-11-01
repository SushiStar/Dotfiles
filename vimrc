"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'rking/ag.vim'

Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-qsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'vim-python/python-syntax', {'for':'python'}

" Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

Plug 'sushistar/sfm.nvim',
Plug 'nvim-tree/nvim-web-devicons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'

call plug#end()

" Customized functions ##############################################
source ~/Dotfiles/customizedFunctions.vim

" airline  ######################################################
let g:airline_theme = 'everforest'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 1

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

lua << EOF
require("sfm").setup({
  view = {
    side = "left",
    width = 40,
    float = {
      enable = false,
    },
    selection_render_method = "icon", -- render method of selected entries, can be `icon`, `sign`, `highlight`.
  },
  mappings = {
    custom_only = true,
    list = {
      {
         key = "<CR>",
         action = "edit",
      },
      {
        key = "<C-v>",
        action = "vsplit",
      },
      {
        key = "R",
        action = "reload",
      },
      {
        key = "t",
        action = "tabdrop",
      },
      {
        key = "P",
        action = "parent_entry",
      },
    },
  },
  file_nesting = {
    enabled = false,
    expand = false,
    patterns = {},
  },
  misc = {
    trash_cmd = nil,
    system_open_cmd = nil,
  }
})
vim.api.nvim_set_keymap('n', '<leader>e', ':SFMToggle<CR>', { noremap = true, silent = true })


-- clangd configuration ##########################################

-- Setup language servers.
local lspconfig = require('lspconfig')

--local cmp = require'cmp'

-- config completion

-- config completion
vim.g.coq_settings = {
  auto_start = 'shut-up',
  completion = { always = true },
  keymap = {
      jump_to_mark = "",
      pre_select = true,
  },
  clients = {
    snippets = {
        warn = {},
        enabled = false,
    },
  },
};

--[[
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
--]]

-- Set configuration for specific filetype.

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

-- lspconfig.clangd.setup({
--    capabilities = {require('cmp_nvim_lsp').default_capabilities()},

lspconfig.clangd.setup({
    capabilities = {require('coq').lsp_ensure_capabilities({
        on_attach = on_attach,
        cmd = { "clangd",
                "--completion-style=detailed",
                "--background-index",
                "--enable-config",},}),},
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


-- call format on save
vim.cmd([[autocmd BufWritePre *.c, *.cc, *.cpp, *h, *.hh, *.hpp lua vim.lsp.buf.format()]])

EOF

