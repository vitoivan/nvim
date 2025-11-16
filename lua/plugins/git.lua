-- Plugins relacionados a Git

return {
	-- Git blame
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- LazyGit
	{
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Fugitive
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gdiffsplit", "Gvdiffsplit" },
	},
}

