
require('gitsigns_config')
require('nvim-autopairs').setup{}
require('treesitter_config')
require('lsp_config')
require('copilot_chat_config')
require('github_theme')
require('keymap_config')
require('persisted_config')

-- Define a function to get the current time
local function get_current_time()
  return os.date('%H:%M:%S')  -- Format time as HH:MM:SS
end

local function relative_filepath()
  return vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')  -- Relative to the current directory
end

-- Set up lualine with time on the right side
require('lualine').setup({
  options = {
    theme = 'github_dark_dimmed',  -- Use github_dark_dimmed color scheme
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { relative_filepath },
    lualine_x = { 'location' },
    lualine_y = { get_current_time },
    lualine_z = {  }  -- Display time on the far right
  },
})

-- Refresh the time every second
local timer = vim.loop.new_timer()
timer:start(0, 1000, vim.schedule_wrap(function()
  require('lualine').refresh()  -- Force lualine to refresh
end))

require"gitlinker".setup({
  opts = {
    remote = "origin", -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- print the url after performing the action
    print_url = true,
  },
})

