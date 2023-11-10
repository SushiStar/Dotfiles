"########################### plugins ################################
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'rking/ag.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'sushistar/sfm.nvim',
Plug 'lewis6991/gitsigns.nvim'

Plug 'numToStr/FTerm.nvim'

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


" FZF Config ####################################################
nnoremap <silent> <Leader>z :FZF<CR>
let g:fzf_action = {
            \ 'enter': 'tabnew',
            \ 'ctrl-v': 'vsplit'}

" AG  Config ####################################################
let g:ag_working_path_mode="r"

lua << EOF
-- GitSigns #######################################################
require('gitsigns').setup()

require("sfm").setup({
  view = {
    side = "left",
    width = 45,
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
local cmp = require('cmp')


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

lspconfig.clangd.setup({
   capabilities = {require('cmp_nvim_lsp').default_capabilities()},
   filetypes = { "h", "hh", "hpp", "c",  "cc", "cpp"},
   root_dir = lspconfig.util.root_pattern('.git', 'compile_commands.json'),
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
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
    -- vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  end,
})


-- call format on save
-- vim.api.nvim_exec([[autocmd BufWritePre *.c, *.cc, *.cpp, *h, *.hh, *.hpp :lua vim.lsp.buf.format()]], false)
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})

-- FTerm ##########################################################
require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<space>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<space>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

EOF

