-- Configuração de LSP usando LSP nativo do Neovim 0.11

local lsp = require("config.lsp")

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"typescript-language-server",
				"eslint-lsp",
				"gopls",
				"lua-language-server",
				"html-lsp",
				"emmet-ls",
				"tailwindcss-language-server",
				"stylua",
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		opts = {},
		config = function()
			-- Configuração do LSP attach (keymaps, etc)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					lsp.setup_lsp_attach(event)
				end,
			})

			-- Inicia todos os LSPs quando necessário
			lsp.setup_servers()
		end,
	},
}
