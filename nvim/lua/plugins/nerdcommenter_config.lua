return {
  "preservim/nerdcommenter",
  event = "VeryLazy",  -- or remove to load immediately
  init = function()
    -- Global settings
    vim.g.NERDTrimTrailingWhitespace = 1
    vim.g.NERDCommentEmptyLines = 1
    vim.g.NERDSpaceDelims = 1

    -- Keymaps (normal + visual mode)
    vim.keymap.set({ "n", "v" }, "'ci", "<Plug>NERDCommenterToggle", { silent = true })
    vim.keymap.set({ "n", "v" }, "'cs", "<Plug>NERDCommenterSexy", { silent = true })
  end,
}

