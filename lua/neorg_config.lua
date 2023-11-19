local meta_gen_template= {
    -- The title field generates a title for the file based on the filename.
    {
        "title",
        function()
            return vim.fn.expand("%:p:t:r")
        end,
    },

    -- The description field is always kept empty for the user to fill in.
    { "description", "" },

    -- The authors field is autopopulated by querying the current user's system username.
    {
        "authors",
        function()
            return "Wei Du"
        end,
    },

    -- When creating fresh, new metadata, the updated field is populated the same way
    -- as the `created` date.
    {
        "updated",
        get_timestamp,
    },
}

require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/playground/daily",
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = "<Space>",
            },
        },
        ["core.journal"] = {
            config = {
                strategy = "flat",
            },
        },
        ["core.esupports.metagen"] = {
            config = {
                timezone = "implicit-local",
                template = meta_gen_template,
            },
        },
        ["core.concealer"] = {
            config = {
                icon_preset = "diamond",
            },
        },
    },
}

