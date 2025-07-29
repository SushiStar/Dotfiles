return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    vim.notify = notify

    notify.setup({
      stages = "fade_in_slide_out", -- or "slide", "fade_in_slide_out", etc.
      timeout = 3000,  -- ms
      render = "default",
      background_colour = "#000000",
    })
  end,
}

