return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- always get the latest
    config = function()
      require("toggleterm").setup({
        -- 📦 Basic settings
        open_mapping = [[<C-\>]], -- Ctrl+\ toggles terminal
        shade_terminals = true,
        direction = "float", -- or "horizontal" / "vertical" / "tab"
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          width = function() return math.floor(vim.o.columns * 0.8) end,
          height = function() return math.floor(vim.api.nvim_win_get_height(0) * 0.8) end,
        },
      })

      -- 🧭 Optional: keymaps for convenience
      local Terminal = require("toggleterm.terminal").Terminal

    end,
  },
}

