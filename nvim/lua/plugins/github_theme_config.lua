return {
    "projekt0n/github-nvim-theme",
    config = function()
      require('github-theme').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath('cache') .. '/github-theme',
          compile_file_suffix = '_compiled', -- Compiled file suffix
          hide_end_of_buffer = false, -- Hide the '~' character at the end of the buffer for a cleaner look
          hide_nc_statusline = true, -- Override the underline style for non-active statuslines
          transparent = false,       -- Disable setting background
          terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,       -- Non focused panes set to alternative background
          module_default = true,     -- Default enable value for modules
          styles = {                 -- Style to be applied to different syntax groups
            comments = 'italic',       -- Value is any valid attr-list value `:help attr-list`
            functions = 'italic',
            keywords = 'NONE',
            variables = 'NONE',
            conditionals = 'NONE',
            constants = 'NONE',
            numbers = 'italic',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
          },
          inverse = {                -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          darken = {                 -- Darken floating windows and sidebar-like windows
            floats = false,
            sidebars = {
              enabl = true,
              list = {},             -- Apply dark background to specific windows
            },
          },
          modules = {                -- List of various plugins and additional options
              treesitter = {
                  enable = true,
                  background = true,
              },
              gitsigns = {
                  enable = true,
                  background = true,
              }
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- setup must be called before loading
      vim.cmd('colorscheme github_dark_dimmed')
    end,
}
