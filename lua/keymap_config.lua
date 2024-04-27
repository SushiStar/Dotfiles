
vim.keymap.set('n', '<Leader>z', ':FZF<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', ':Texplore<CR>', {silent = true})
vim.keymap.set('n', '<Leader>v', ':Vexplore!<CR>', {silent = true})
vim.keymap.set('n', '<Leader>s', ':Gitsigns preview_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>j', ':Gitsigns next_hunk<CR>', {silent = true})
vim.keymap.set('n', '<Leader>k', ':Gitsigns prev_hunk<CR>', {silent = true})

vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
