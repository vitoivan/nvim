-- Configuração simples do TypeScript Language Server usando LSP nativo

local M = {}

-- Função para encontrar o root_dir do projeto
local function find_root_dir(fname)
	local root_files = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
	local dir = vim.fn.fnamemodify(fname, ":p:h")
	
	while dir ~= "/" and dir ~= "" do
		for _, file in ipairs(root_files) do
			local path = dir .. "/" .. file
			if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then
				return dir
			end
		end
		dir = vim.fn.fnamemodify(dir, ":h")
	end
	
	return vim.fn.getcwd()
end

-- Configura e inicia o LSP do TypeScript
function M.setup()
	local mason_path = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server"
	local tls_bin = mason_path .. "/node_modules/.bin/typescript-language-server"
	
	-- Se não encontrar no Mason, tenta no PATH
	if vim.fn.executable(tls_bin) == 0 then
		tls_bin = "typescript-language-server"
	end
	
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
	end
	
	local config = {
		name = "typescript-language-server",
		cmd = { tls_bin, "--stdio" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		root_dir = find_root_dir,
		single_file_support = true,
		capabilities = capabilities,
		offset_encoding = "utf-16",
		settings = {
			typescript = {
				inlayHints = {
					parameterNames = { enabled = "all" },
					variableTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
				},
			},
			javascript = {
				inlayHints = {
					parameterNames = { enabled = "all" },
					variableTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
				},
			},
		},
		init_options = {
			maxTsServerMemory = 4096,
			hostInfo = "neovim",
		},
	}
	
	return config
end

-- Inicia o LSP quando um arquivo TypeScript é aberto
function M.start()
	local bufnr = vim.api.nvim_get_current_buf()
	
	-- Verifica se já existe um cliente ativo para este buffer
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "typescript-language-server" })
	if #clients > 0 then
		return
	end
	
	local config = M.setup()
	if config then
		vim.lsp.start(config, { bufnr = bufnr })
	end
end

-- Retorna os formatters do TypeScript
function M.get_formatters()
	return {
		javascript = { "eslint", "prettier_d" },
		typescript = { "prettierd", "prettier_d", "eslint" },
	}
end

return M
