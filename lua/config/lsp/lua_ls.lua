-- Configuração do Lua Language Server

return {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}

