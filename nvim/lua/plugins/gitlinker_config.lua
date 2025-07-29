return {
  "ruifm/gitlinker.nvim",
  config = function()
    require("gitlinker").setup({
      opts = {
        remote = "origin",
        add_current_line_on_normal_mode = true,
        print_url = false,
        action_callback = function(url)
          vim.notify("🔗 Git link:\n" .. url)
        end,
      },
    })
  end,
}

