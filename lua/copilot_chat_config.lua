require("CopilotChat").setup {
  model = 'claude-sonnet-4',
  mappings = {
    complete = {
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
    },
    reset = {
      insert = '<C-l>',
      normal = '<C-d>',
    },
    submit_prompt = {
      normal = '<CR>',
    },
  },
}

-- Remove Copilot and nvim-cmp <Tab> mappings in CopilotChat buffers to avoid conflicts
local function remove_tab_mappings()
  pcall(function() vim.api.nvim_buf_del_keymap(0, "i", "<Tab>") end)
  pcall(function() vim.api.nvim_buf_del_keymap(0, "i", "<S-Tab>") end)
end

-- Use an augroup to prevent duplicate autocommands
local group = vim.api.nvim_create_augroup("CopilotChatTabFix", { clear = true })

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  group = group,
  pattern = "copilot-chat",
  callback = function()
    vim.defer_fn(remove_tab_mappings, 50)
  end,
})


-- Auto-delete copilot chat buffers on VimExit
vim.api.nvim_create_autocmd("VimLeavePre", {
  pattern = "*",
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].filetype == "copilot-chat" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})
