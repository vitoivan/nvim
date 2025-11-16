-- Plugins de formatação

local typescript = require("config.lsp.typescript")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = vim.tbl_extend("force", {
				lua = { "stylua" },
			}, typescript.get_formatters()),
		},
	},
}

