-- Plugins de UI (colorscheme, statusline, file explorer)

return {
	-- Colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				contrast = "hard",
				transparent_mode = false,
				italic = {
					strings = true,
					comments = true,
					folds = true,
				},
				overrides = {},
			})
			vim.o.termguicolors = true
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	-- Neo-tree (file explorer)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_git_status = false,
				enable_diagnostics = false,
				filtered_items = {
					hide_dotfiles = false,
					hide_by_name = {
						"node_modules",
					},
					hide_by_pattern = {
						"*-lock.json",
					},
					always_show = {
						".env",
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
	},

	-- Mini.nvim (statusline e outras utilidades)
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}

