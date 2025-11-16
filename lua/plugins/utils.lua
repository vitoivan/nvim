-- Plugins utilitários diversos

return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Comment
	{ "numToStr/Comment.nvim", opts = {} },

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- Poetry
	{
		"karloskar/poetry-nvim",
		config = function()
			require("poetry-nvim").setup()
		end,
	},
}

