require('FTerm').setup({
    border = 'rounded',
    dimensions  = {
        height = 0.8,
        width = 0.8,
    },
})
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = false})
