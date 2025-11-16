-- Plugins relacionados ao Treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}

