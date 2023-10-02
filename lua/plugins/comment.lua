
return {
    'numToStr/Comment.nvim',
    config = function()

        require("Comment").setup({
        -- toggler = {
        --     line = "<leader>/",
        --     block = "<leader>cb",
        -- },
        -- opleader = {
        --     line = "<leader>/",
        --     block = "<leader>cb",
        -- },
        })
    end,
    lazy = false,
}
