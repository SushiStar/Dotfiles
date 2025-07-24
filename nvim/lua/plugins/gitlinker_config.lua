return {
    "ruifm/gitlinker.nvim",
    config = function()
        require"gitlinker".setup({
          opts = {
            remote = "origin", -- force the use of a specific remote
            -- adds current line nr in the url for normal mode
            add_current_line_on_normal_mode = true,
            -- print the url after performing the action
            print_url = true,
          },
        })
    end,
}

