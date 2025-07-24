-- Plugin management using lazy.nvim
return {
  -- General plugins
    "windwp/nvim-autopairs"  ,
    "tpope/vim-surround"  ,
    "burntsushi/ripgrep"  ,
    "junegunn/fzf"  ,
    "majutsushi/tagbar"  ,

    require("plugins.nerdcommenter_config"),
    require("plugins.neorg_config"),

  -- LSP and completion
    require("plugins.lsp_config"),

  -- UI and colors
    require("plugins.github_theme_config"),
    require("plugins.lualine_config"),

  -- Git and session
    require("plugins.gitsigns_config"),
    require("plugins.persisted_config"),

  -- Treesitter and extras
    require("plugins.treesitter_config"),

    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
    require("plugins.gitlinker_config"),
    require("plugins.copilot_chat_config"), -- CopilotChat configuration
}
