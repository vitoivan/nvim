-- Configuração geral do LSP usando LSP nativo do Neovim 0.11

local M = {}

-- Função auxiliar para encontrar root_dir
local function find_root_dir(fname, root_files)
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

-- Configuração do LSP attach (keymaps, etc)
function M.setup_lsp_attach(event)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	-- Função customizada para go to definition com fallback para implementation
	local function goto_definition()
		vim.lsp.buf.definition({
			reuse_win = true,
			on_list = function(options)
				-- Se não encontrou definição, tenta implementation
				if not options.items or #options.items == 0 then
					vim.lsp.buf.implementation({
						reuse_win = true,
					})
				else
					-- Processa os resultados manualmente
					local items = options.items
					local offset_encoding = options.offset_encoding or "utf-16"
					
					-- Se o primeiro item tem 'uri', são Locations e precisam ser convertidos
					if items[1] and items[1].uri then
						local ok, converted = pcall(vim.lsp.util.locations_to_items, items, offset_encoding)
						if ok and converted and #converted > 0 then
							items = converted
						else
							-- Se a conversão falhou, tenta processar diretamente
							if #items == 1 then
								local loc = items[1]
								if loc.uri and loc.range then
									local fname = vim.uri_to_fname(loc.uri)
									local start = loc.range.start
									vim.cmd("edit " .. vim.fn.fnameescape(fname))
									vim.api.nvim_win_set_cursor(0, { start.line + 1, start.character })
									return
								end
							end
							return
						end
					end
					
					-- Verifica se items tem a estrutura correta de quickfix
					if items[1] and items[1].filename and items[1].lnum then
						-- Se só tem um resultado, vai direto
						if #items == 1 then
							local item = items[1]
							local current_file = vim.api.nvim_buf_get_name(0)
							if current_file ~= item.filename then
								vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
							end
							vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
						else
							-- Se tem múltiplos, usa quickfix
							vim.fn.setqflist({}, " ", {
								title = "LSP Definitions",
								items = items,
							})
							vim.cmd("copen")
							
							-- Fecha o quickfix automaticamente quando selecionar um item
							local augroup = vim.api.nvim_create_augroup("lsp_definitions_quickfix", { clear = true })
							local qf_bufnr = vim.api.nvim_get_current_buf()
							vim.api.nvim_create_autocmd({ "BufEnter" }, {
								group = augroup,
								callback = function()
									local current_buf = vim.api.nvim_get_current_buf()
									-- Se entrou em um buffer que não é o quickfix, fecha o quickfix
									if current_buf ~= qf_bufnr and vim.bo.filetype ~= "qf" then
										vim.cmd("cclose")
										vim.api.nvim_del_augroup_by_id(augroup)
									end
								end,
							})
						end
					end
				end
			end,
		})
	end

	map("gd", goto_definition, "[G]oto [D]efinition")
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- Document highlight
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
		local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = function()
				for _, client2 in ipairs(vim.lsp.get_clients({ bufnr = event.buf })) do
					if client2.server_capabilities.documentHighlightProvider then
						vim.lsp.buf.document_highlight()
						break
					end
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = group,
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- Função auxiliar para encontrar binário (prioridade: PATH > Mason)
local function find_bin(package_name, bin_name)
	-- 1. PRIORIDADE: Tenta encontrar no PATH primeiro
	local bin_base = vim.fn.fnamemodify(bin_name, ":t")  -- Pega só o nome do arquivo
	local which = vim.fn.system("which " .. bin_base .. " 2>/dev/null"):gsub("%s+", "")
	if which and which ~= "" and vim.fn.executable(which) == 1 then
		return which
	end
	
	-- 2. Para ESLint, tenta também no node_modules do projeto
	if package_name == "eslint-lsp" then
		local cwd = vim.fn.getcwd()
		local local_bin = cwd .. "/node_modules/.bin/eslint"
		if vim.fn.executable(local_bin) == 1 then
			return local_bin
		end
	end
	
	-- 3. FALLBACK: Tenta encontrar no Mason
	local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
	local bin = mason_path .. "/" .. package_name .. "/" .. bin_name
	
	-- Verifica se o binário existe e é executável
	if vim.fn.executable(bin) == 1 then
		return bin
	end
	
	-- Se não encontrar, retorna nil para evitar erro
	return nil
end

-- Configurações dos LSPs usando LSP nativo
function M.setup_servers()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
	end
	
	-- TypeScript
	local typescript = require("config.lsp.typescript")
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "typescript-language-server" })
			if #clients == 0 then
				local config = typescript.setup()
				vim.lsp.start(config, { bufnr = bufnr })
			end
		end,
	})

	-- ESLint (só inicia se houver configuração do ESLint no projeto)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })
			if #clients > 0 then
				return
			end
			
			-- Verifica se há configuração do ESLint no projeto
			local fname = vim.api.nvim_buf_get_name(bufnr)
			local root = find_root_dir(fname, { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc", "eslint.config.js", "package.json" })
			
			local eslint_configs = {
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.json",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc",
				"eslint.config.js",
			}
			
			local has_eslint = false
			for _, config_file in ipairs(eslint_configs) do
				if vim.fn.filereadable(root .. "/" .. config_file) == 1 then
					has_eslint = true
					break
				end
			end
			
			-- Verifica se eslint está no package.json
			if not has_eslint then
				local package_json = root .. "/package.json"
				if vim.fn.filereadable(package_json) == 1 then
					local content = vim.fn.readfile(package_json)
					for _, line in ipairs(content) do
						if string.find(line, '"eslint"') then
							has_eslint = true
							break
						end
					end
				end
			end
			
			-- Só inicia se houver configuração do ESLint
			if has_eslint then
				local eslint_bin = find_bin("eslint-lsp", "node_modules/.bin/eslint")
				-- Verifica se o binário existe e é executável antes de iniciar
				if eslint_bin and vim.fn.executable(eslint_bin) == 1 then
					vim.lsp.start({
						name = "eslint",
						cmd = { eslint_bin, "--stdio" },
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
						root_dir = root,
						capabilities = capabilities,
						offset_encoding = "utf-16",
					}, { bufnr = bufnr })
				end
			end
		end,
	})

	-- Go (otimizado para primeira inicialização rápida)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "go", "gomod" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "gopls" })
			if #clients > 0 then
				return
			end
			
			-- Usa defer_fn para não bloquear o Neovim durante a inicialização
			vim.defer_fn(function()
				local gopls_bin = find_bin("gopls", "gopls")
				if gopls_bin and vim.fn.executable(gopls_bin) == 1 then
					vim.lsp.start({
						name = "gopls",
						cmd = { gopls_bin },
						filetypes = { "go", "gomod" },
						root_dir = function(fname)
							return find_root_dir(fname, { "go.mod", "go.work", ".git" })
						end,
						capabilities = capabilities,
						offset_encoding = "utf-16",
						settings = {
							gopls = {
								-- Ignora diretórios que não são relevantes (acelera indexação inicial)
								directoryFilters = {
									"-**/node_modules",
									"-**/vendor",
									"-**/testdata",
									"-**/.git",
									"-**/tmp",
									"-**/temp",
								},
								-- Desabilita análises pesadas que demoram na primeira inicialização
								analyses = {
									unusedparams = false,
									unusedwrite = false,
									fieldalignment = false, -- Muito lento em projetos grandes
									nilness = false,
									shadow = false,
								},
								-- Melhora performance inicial
								usePlaceholders = true,
								completeUnimported = true,
								matcher = "Fuzzy",
								deepCompletion = false,
								-- Cache mais agressivo
								buildCacheKey = true,
								-- Limita escopo de busca para acelerar
								expandWorkspaceToModule = false,
							},
						},
					}, { bufnr = bufnr })
				end
			end, 100) -- Delay pequeno para não bloquear
		end,
	})

	-- Lua
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "lua" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "lua_ls" })
			if #clients == 0 then
				local lua_bin = find_bin("lua-language-server", "bin/lua-language-server")
				if lua_bin and vim.fn.executable(lua_bin) == 1 then
					vim.lsp.start({
						name = "lua_ls",
						cmd = { lua_bin },
						filetypes = { "lua" },
						root_dir = function(fname)
							return find_root_dir(fname, { ".luarc.json", ".luarc.jsonc", ".git" })
						end,
						capabilities = capabilities,
						offset_encoding = "utf-16",
						settings = {
							Lua = {
								completion = { callSnippet = "Replace" },
							},
						},
					}, { bufnr = bufnr })
				end
			end
		end,
	})

	-- Templ
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "templ" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "templ" })
			if #clients == 0 then
				vim.lsp.start({
					name = "templ",
					cmd = { "templ", "lsp" },
					filetypes = { "templ" },
					root_dir = function(fname)
						return find_root_dir(fname, { "go.mod", ".git" })
					end,
					capabilities = capabilities,
					offset_encoding = "utf-16",
				}, { bufnr = bufnr })
			end
		end,
	})

	-- HTML
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "html", "hbs" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "html" })
			if #clients == 0 then
				local html_bin = find_bin("html-lsp", "node_modules/.bin/html-lsp")
				if html_bin and vim.fn.executable(html_bin) == 1 then
					vim.lsp.start({
						name = "html",
						cmd = { html_bin, "--stdio" },
						filetypes = { "html", "hbs" },
						root_dir = function(fname)
							return find_root_dir(fname, { "package.json", ".git" })
						end,
						capabilities = capabilities,
						offset_encoding = "utf-16",
					}, { bufnr = bufnr })
				end
			end
		end,
	})

	-- HTMX
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "html", "templ" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "htmx" })
			if #clients == 0 then
				vim.lsp.start({
					name = "htmx",
					cmd = { "htmx-lsp" },
					filetypes = { "html", "templ" },
					root_dir = function(fname)
						return find_root_dir(fname, { "package.json", ".git" })
					end,
					capabilities = capabilities,
					offset_encoding = "utf-16",
				}, { bufnr = bufnr })
			end
		end,
	})

	-- Emmet
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "html", "templ", "tsx", "jsx" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "emmet_ls" })
			if #clients == 0 then
				local emmet_bin = find_bin("emmet-ls", "node_modules/.bin/emmet-ls")
				if emmet_bin and vim.fn.executable(emmet_bin) == 1 then
					vim.lsp.start({
						name = "emmet_ls",
						cmd = { emmet_bin, "--stdio" },
						filetypes = { "html", "templ", "tsx", "jsx" },
						root_dir = function(fname)
							return find_root_dir(fname, { "package.json", ".git" })
						end,
						capabilities = capabilities,
						offset_encoding = "utf-16",
					}, { bufnr = bufnr })
				end
			end
		end,
	})

	-- TailwindCSS
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "html", "hbs", "templ", "tmpl", "javascript", "react", "css", "typescript", "typescriptreact" },
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "tailwindcss" })
			if #clients == 0 then
				local tailwind_bin = find_bin("tailwindcss-language-server", "node_modules/.bin/tailwindcss-language-server")
				if tailwind_bin and vim.fn.executable(tailwind_bin) == 1 then
					vim.lsp.start({
						name = "tailwindcss",
						cmd = { tailwind_bin, "--stdio" },
						filetypes = { "html", "hbs", "templ", "tmpl", "javascript", "react", "css", "typescript", "typescriptreact" },
						root_dir = function(fname)
							return find_root_dir(fname, { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" })
						end,
						capabilities = capabilities,
						offset_encoding = "utf-16",
					}, { bufnr = bufnr })
				end
			end
		end,
	})
end

return M
