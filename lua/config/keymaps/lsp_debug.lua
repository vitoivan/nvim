-- Keymaps para debug e visualização do LSP

-- Comando para mostrar configuração do LSP TypeScript
vim.api.nvim_create_user_command("LSPConfigTS", function()
	local ts = require("config.lsp.typescript")
	local config = ts.get_lsp_config()
	local ts_config = config["ts_ls"] or config["typescript-language-server"]
	
	print("=== TypeScript LSP Configuration ===")
	print("Settings:")
	print(vim.inspect(ts_config.settings, { depth = 3 }))
	print("\nInit Options:")
	print(vim.inspect(ts_config.init_options, { depth = 2 }))
	print("\nFlags:")
	print(vim.inspect(ts_config.flags, { depth = 2 }))
end, { desc = "Show TypeScript LSP configuration" })

-- Comando para mostrar todos os servidores LSP configurados
vim.api.nvim_create_user_command("LSPConfigAll", function()
	local lsp = require("config.lsp")
	local servers = lsp.get_servers()
	
	print("=== All LSP Servers Configuration ===")
	for name, config in pairs(servers) do
		print("\n" .. name .. ":")
		if type(config) == "table" then
			for k, v in pairs(config) do
				if k ~= "on_attach" and k ~= "root_dir" then
					if type(v) == "table" then
						print("  " .. k .. ": " .. vim.inspect(v, { depth = 2 }))
					else
						print("  " .. k .. ": " .. tostring(v))
					end
				end
			end
		end
	end
end, { desc = "Show all LSP servers configuration" })

-- Comando para mostrar informações do cliente LSP atual
vim.api.nvim_create_user_command("LSPClientInfo", function()
	local clients = vim.lsp.get_clients()
	local bufnr = vim.api.nvim_get_current_buf()
	local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
	
	print("=== LSP Clients Information ===")
	print("\nAll clients (" .. #clients .. "):")
	for _, client in ipairs(clients) do
		print("  - " .. client.name .. " (ID: " .. client.id .. ")")
		print("    Root: " .. (client.config.root_dir or "N/A"))
		if client.config.cmd then
			print("    CMD: " .. vim.inspect(client.config.cmd))
		end
		print("    Capabilities: " .. vim.inspect(client.server_capabilities, { depth = 1 }))
	end
	
	print("\nBuffer clients (" .. #buf_clients .. "):")
	for _, client in ipairs(buf_clients) do
		print("  - " .. client.name .. " (ID: " .. client.id .. ")")
		if client.config.settings then
			print("    Settings: " .. vim.inspect(client.config.settings, { depth = 2 }))
		end
		if client.config.cmd then
			print("    CMD: " .. vim.inspect(client.config.cmd))
		end
	end
end, { desc = "Show current LSP client information" })

-- Comando para diagnosticar problemas do TypeScript LSP
vim.api.nvim_create_user_command("TSDiagnose", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })
	
	if #clients == 0 then
		clients = vim.lsp.get_clients({ bufnr = bufnr, name = "typescript-language-server" })
	end
	
	print("=== TypeScript LSP Diagnostics ===")
	
	if #clients > 0 then
		local client = clients[1]
		local fname = vim.api.nvim_buf_get_name(bufnr)
		
		print("\n1. Cliente LSP:")
		print("   Nome: " .. client.name)
		print("   ID: " .. client.id)
		print("   Root dir: " .. (client.config.root_dir or "N/A"))
		
		print("\n2. Arquivo atual:")
		print("   " .. fname)
		
		-- Verifica root_dir detectado
		if client.config.root_dir then
			local root = client.config.root_dir(fname)
			print("   Root detectado: " .. root)
			
			-- Verifica se tsconfig.json existe
			local tsconfig = root .. "/tsconfig.json"
			if vim.fn.filereadable(tsconfig) == 1 then
				print("   ✓ tsconfig.json encontrado")
			else
				print("   ✗ tsconfig.json NÃO encontrado")
			end
			
			-- Verifica package.json
			local package_json = root .. "/package.json"
			if vim.fn.filereadable(package_json) == 1 then
				print("   ✓ package.json encontrado")
			else
				print("   ✗ package.json NÃO encontrado")
			end
		end
		
		print("\n3. Configurações:")
		if client.config.settings and client.config.settings.typescript then
			print("   workspaceSymbols: " .. tostring(client.config.settings.typescript.workspaceSymbols.enabled))
			print("   projectReferences: " .. tostring(client.config.settings.typescript.locate.projectReferences))
		end
		
		print("\n4. Capabilities:")
		print("   hoverProvider: " .. tostring(client.server_capabilities.hoverProvider ~= nil))
		print("   definitionProvider: " .. tostring(client.server_capabilities.definitionProvider ~= nil))
		print("   workspaceSymbolProvider: " .. tostring(client.server_capabilities.workspaceSymbolProvider ~= nil))
		
		print("\n5. CMD usado:")
		if client.config.cmd then
			print("   " .. vim.inspect(client.config.cmd))
		else
			print("   (padrão do Mason)")
		end
		
		print("\n6. Teste de hover:")
		print("   Use 'K' no cursor sobre um símbolo para testar")
		print("   Use ':LspInfo' para ver status detalhado")
	else
		print("TypeScript LSP não está ativo neste buffer")
		print("Execute :LspInfo para ver quais LSPs estão ativos")
	end
end, { desc = "Diagnose TypeScript LSP issues" })

-- Comando para verificar versão do TypeScript usada
vim.api.nvim_create_user_command("TSCheckVersion", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })
	
	if #clients == 0 then
		clients = vim.lsp.get_clients({ bufnr = bufnr, name = "typescript-language-server" })
	end
	
	if #clients > 0 then
		local client = clients[1]
		print("=== TypeScript Version Check ===")
		if client.config.cmd then
			print("CMD: " .. vim.inspect(client.config.cmd))
		end
		
		-- Tenta verificar versão do TypeScript no projeto
		local cwd = vim.fn.getcwd()
		local package_json = cwd .. "/package.json"
		if vim.fn.filereadable(package_json) == 1 then
			local content = vim.fn.readfile(package_json)
			for _, line in ipairs(content) do
				if string.find(line, '"typescript"') then
					print("TypeScript no package.json: " .. line)
				end
			end
		end
		
		-- Verifica versão global
		local global_ts = vim.fn.system("npm list -g typescript --depth=0 2>/dev/null | grep typescript")
		if global_ts and global_ts ~= "" then
			local ts_version = global_ts:gsub("%s+", " ")
			print("TypeScript global: " .. ts_version)
			
			-- Verifica se é versão nightly/dev (contém "dev" ou versão >= 6.0.0-dev)
			if string.find(ts_version:lower(), "dev") or string.find(ts_version, "6%.") or string.find(ts_version, "next") then
				print("✓ TypeScript NIGHTLY detectado! (versão de desenvolvimento)")
			else
				print("TypeScript estável (para usar nightly: npm install -g typescript@next)")
			end
		end
	else
		print("TypeScript LSP não está ativo neste buffer")
	end
end, { desc = "Check TypeScript version being used" })

