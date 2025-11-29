-- Configuração do ESLint

return {
	eslint = {
		root_dir = require("lspconfig").util.root_pattern(
			"yarn.lock",
			"package-lock.json",
			"tsconfig.json",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.json",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc", -- legacy
			"eslint.config.js" -- flat config (v9+)
		),
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		cmd = { "eslint_d", "--stdin", "--stdin-filename", "$FILENAME", "--format", "json" },
	},
}
