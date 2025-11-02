return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- always get the latest
    config = function()
      require("toggleterm").setup({
        -- 📦 Basic settings
        size = 15,
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
        },
      })

      -- 🧭 Optional: keymaps for convenience
      local Terminal = require("toggleterm.terminal").Terminal

    end,
  },
}

