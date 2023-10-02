return {
    "folke/tokyonight.nvim",
    config = function()
        vim.cmd([[colorscheme tokyonight-night]])
        require("tokyonight").setup{
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        }
    end,
}

-- highlight Normal ctermbg=none
-- highlight NonText ctermbg=none
