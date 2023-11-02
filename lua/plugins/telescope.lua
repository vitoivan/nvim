return {
	"nvim-telescope/telescope.nvim",
	requires = {
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable("make") == 1, build = "make" },
	},
	-- cmd = {"Telescope"},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node%_modules/.*",
					"%lock.json",
					"%.venv/.*",
					"venv/.*",
					"dist/.*",
					"%.git/.*",
				},
				-- vimgrep_arguments = {
				-- 	"rg",
				-- 	"--color=never",
				-- 	"--no-heading",
				-- 	"--with-filename",
				-- 	"--line-number",
				-- 	"--column",
				-- 	"--smart-case",
				-- 	"--hidden",
				-- },
				git_worktrees = vim.g.git_worktrees,
				prompt_prefix = "> ",
				selection_caret = ">",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55 },
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = { q = actions.close },
				},
			},
		})
	end,
}
