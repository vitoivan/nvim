-- Configuração de todos os plugins
-- Agrupa todos os plugins por categoria

return {
	-- Importa plugins de cada categoria
	{ import = "plugins.git" },
	{ import = "plugins.lsp" },
	{ import = "plugins.completion" },
	{ import = "plugins.formatting" },
	{ import = "plugins.telescope" },
	{ import = "plugins.ui" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.ia" },
	{ import = "plugins.utils" },
}
