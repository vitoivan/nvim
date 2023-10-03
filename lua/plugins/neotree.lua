return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Neotree" },
	event = "VimEnter", -- loads neotree when use "vim ."
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filtered_items = {
				hide_by_name = {
					"node_modules",
				},
				hide_by_pattern = { -- uses glob style patterns
					--"*.meta",
					"*-lock.json",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					--".gitignored",
					".env",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = { -- uses glob style patterns
					--".null-ls_*",
				},
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
			window = {
				position = "current",
				mappings = {
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		})
	end,
}
