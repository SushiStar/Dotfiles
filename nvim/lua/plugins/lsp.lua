return {
  "neovim/nvim-lspconfig",
  version = "v2.1.0",  -- stable and fully compatible with Neovim ≤0.12 configs
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }

    -- clangd
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--compile-commands-dir=/home/wdu/av",
      },
      filetypes = { "h", "hh", "hpp", "c", "cc", "cpp" },
      root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json"),
      init_options = {
        semanticHighlighting = true,
        compilationDatabasePath = vim.fn.getcwd(),
      },
    })

    -- pyright
    lspconfig.pyright.setup({
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python", "py" },
      root_dir = lspconfig.util.root_pattern("pyproject.toml", ".git"),
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
          },
        },
      },
    })

    -- LSP keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = ev.buf, silent = true, noremap = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

