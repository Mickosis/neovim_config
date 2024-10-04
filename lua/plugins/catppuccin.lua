return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    integrations = {
        neotree = true,
        lualine = true,
    },
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            default_integrations = true,
            integrations = {
                neotree = true,
                treesitter = true,
            },
            -- custom_highlights = function(colors)
            --     return {
            --         NeoTreeNormal = { bg = "#191926" },
            --         NeoTreeNormalNC = { bg = "#191926" },
            --     }
            -- end,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
