-- General Neovim settings and custom functions (converted from vimrc and customizedFunctions.vim)

local opt = vim.opt
local g = vim.g

-- General options
opt.filetype = "on"
opt.syntax = "on"
opt.compatible = false
opt.omnifunc = "syntaxcomplete#Complete"
opt.completeopt:append("preview")
opt.textwidth = 100
opt.wrapmargin = 2
opt.colorcolumn = "100"
opt.backspace = { "indent", "eol", "start" }
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.whichwrap:append("hl")
opt.splitbelow = true
opt.splitright = true
opt.switchbuf:append({ "usetab", "newtab", "useopen" })
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.showmode = false
opt.autoindent = true
opt.spelllang = "en_us"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.fillchars = { vert = "│" }
opt.laststatus = 3
opt.termguicolors = true
opt.showtabline = 2
opt.autoread = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 10
opt.conceallevel = 2
opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.grepformat = "%f:%l:%c:%m"

-- Leader key
g.mapleader = " "

-- Netrw settings
g.netrw_browse_split = 0
g.netrw_liststyle = 0
g.netrw_keepdir = 1

-- FZF layout
g.fzf_layout = { window = { width = 0.8, height = 0.8, relative = true } }

vim.cmd [[highlight CursorLineNr cterm=bold term=bold guibg=None guifg=#eb8f34]]
vim.cmd [[highlight MatchParen ctermbg=LightGray ctermfg=Black guibg=black guifg=red]]
vim.cmd [[highlight TabLine guifg=#595756 guibg=None]]
vim.cmd [[highlight TabLineSel gui=bold guifg=#eb8f34 guibg=None]]


-- Quickfix window size
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.cmd("resize 20")
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        pcall(function()
            vim.api.nvim_exec('silent! normal! g`"zv', false)
        end)
    end,
})

-- Netrw: always show line numbers
local netrw_group = vim.api.nvim_create_augroup("NetrwLineNumbers", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = netrw_group,
    pattern = "netrw",
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end,
})

-- Open Netrw if Neovim is started without a file
-- local function is_file_or_directory(path)
    -- local stat = vim.loop.fs_stat(path)
    -- return stat and (stat.type == "file" or stat.type == "directory")
-- end

local function check_arguments_for_files_or_directories()
    for _, arg in ipairs(vim.v.argv) do
        if is_file_or_directory(arg) then
            return true
        end
    end
    return false
end

-- vim.api.nvim_create_autocmd("VimEnter", {
    -- pattern = "*",
    -- callback = function()
        -- if not check_arguments_for_files_or_directories() then
            -- vim.cmd('Explore')
        -- end
    -- end,
-- })

-- Delete non-active buffers if not loaded
local function delete_non_active_buffers()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if not (vim.api.nvim_buf_is_loaded(buf) or vim.b[buf].active) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end

vim.api.nvim_create_user_command('DeleteNonActiveBuffers', delete_non_active_buffers, {})

-- Toggle gitsigns blame
vim.api.nvim_create_user_command('GS', function()
    require('gitsigns').toggle_current_line_blame()
end, {})

-- Search highlighting management
vim.api.nvim_exec([[
augroup AutoHighlighting
    autocmd!
    autocmd CmdlineEnter /,\? set hlsearch
    autocmd CmdlineLeave /,\? set nohlsearch
augroup END
]], false)
