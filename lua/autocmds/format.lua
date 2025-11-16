-- Autocmd para formatar arquivos ao salvar

-- Format templ files on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.templ" },
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

