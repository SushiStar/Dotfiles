-- General and plugin-specific key mappings (converted from vimrc and customizedFunctions.vim)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Tab navigation
map('n', '<Tab>', 'gt', opts)
map('n', '<S-Tab>', 'gT', opts)

-- Window navigation
map('n', '<C-l>', ':winc l<CR>', opts)
map('n', '<C-h>', ':winc h<CR>', opts)
map('n', '<C-k>', ':winc k<CR>', opts)
map('n', '<C-j>', ':winc j<CR>', opts)

-- Toggle line numbers and relative numbers
map('n', '<leader>a', ':set invnumber invrelativenumber<CR>', opts)

-- Terminal mode: exit to normal mode

-- Command mode shortcut
vim.keymap.set("n", ";", ":", { noremap = true })

-- NerdCommenter mappings (if plugin is still used)
map('n', "'ci", "<plug>NERDCommenterToggle", {})
map('n', "'cs", "<plug>NERDCommenterSexy", {})

-- FZF (if you want to add more mappings, do so here)

-- Add more plugin-specific mappings below as needed
vim.keymap.set('n', '<Leader>z', ':FZF<CR>', {silent = true})
vim.keymap.set('n', '<Leader>b', ':Buffers<CR>', {silent = true})
vim.keymap.set('n', '<Leader>g', ':RgDir<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', ':Texplore<CR>', {silent = true})
vim.keymap.set('n', '<Leader>v', ':Vexplore<CR>', {silent = true})
vim.keymap.set('n', '<Leader>s', ':Gitsigns preview_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>j', ':Gitsigns next_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>k', ':Gitsigns prev_hunk<CR>', {silent = true})
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)


vim.keymap.set('n', 'gk', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Go to previous diagnostic (with float)' })

vim.keymap.set('n', 'gj', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Go to next diagnostic (with float)' })

vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- for window resize
vim.api.nvim_set_keymap('n', '<Up>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '==', '<C-W>=', { noremap = true, silent = true })

-- Set different cursor shapes for different modes
vim.opt.guicursor = {
    "n-v-c:block-Cursor/lCursor",  -- Block cursor in normal, visual, and command modes
    "i:ver25-Cursor",              -- Vertical bar cursor in insert mode
    "c:ver25-Cursor",              -- Vertical bar cursor in command-line mode
    "r:hor20-Cursor",              -- Horizontal cursor in replace mode
    "a:blinkwait700-blinkoff400-blinkon250-Cursor"  -- Blinking cursor settings (optional)
}

if vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
else
  vim.opt.clipboard = "unnamedplus"
end

