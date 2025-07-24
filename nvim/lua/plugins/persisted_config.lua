return {
    "olimorris/persisted.nvim",
    config = function()
        require("persisted").setup({
          save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
          silent = false, -- silent nvim message when sourcing session file
          use_git_branch = true, -- create session files based on the branch of a git enabled repository
          default_branch = nil, -- the branch to load if a session file is not found for the current branch
          autosave = true, -- automatically save session files when exiting Neovim
          should_autosave = nil, -- function to determine if a session should be autosaved
          autoload = true, -- automatically load the session for the cwd on Neovim startup
          -- on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
           on_autoload_no_session = function() vim.cmd("Ex") end,
          follow_cwd = false, -- change session file name to match current working directory if it changes
          allowed_dirs = {
              "/home/wdu/av",
              "/home/wdu/Dotfiles",
              "/home/wdu/dump_plot",
          },
          ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
          ignored_branches = nil, -- table of branch patterns that are ignored for auto-saving and auto-loading
          telescope = {},
        })
    end,
}
