
vim.keymap.set('n', '<Leader>z', ':FZF<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', ':Texplore<CR>', {silent = true})
vim.keymap.set('n', '<Leader>v', ':Vexplore!<CR>', {silent = true})
vim.keymap.set('n', '<Leader>s', ':Gitsigns preview_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>j', ':Gitsigns next_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>k', ':Gitsigns prev_hunk<CR>', {silent = true})

vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gj', vim.diagnostic.goto_next)
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

